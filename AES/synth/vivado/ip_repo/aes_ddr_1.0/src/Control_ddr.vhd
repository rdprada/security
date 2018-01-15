
--------------------------------------------------------------------------------
-- Control unit for DDR implementation of Square AES - Low Area version
-- This architecture computes each round in only 3 clock cycles (regular
-- implementation needs 6), but it computes each round twice to provide
-- error detection.
-- ********************************************************************** ------
-- This version is simplified and tailored to the MARS project: hence, only
-- the following functionalities are supported:
-- *** Encryption only (no decryption support)
-- *** 128-bit keys only (no support for longer keys: key schedule should be re-designed)
-- *** ECB only (No feedback modes)
-- To provide extensibility, the interface includes all the required signals
-- anyway, but they are not used in the implementation
--------------------------------------------------------------------------------

library IEEE;
  use IEEE.std_logic_1164.all;
library WORK;
  use WORK.globals.all;

entity control_ddr is port (
  error_inject : out std_logic_vector (7 downto 0);
  go_crypt, go_key : in std_logic; -- active HIGH
  encdec : in std_logic;       -- 0=encrypt, 1=decrypt
  -- key_size : in std_logic_vector(1 downto 0); -- 01=128, 10=192, 11=256
  ready_out : out T_READY;     -- device state: S_READY or S_BUSY
  data_out_ok : out T_ENABLE; -- Validity bit for the output
  ctrl_dec : out T_ENCDEC;     -- S_ENC / S_DEC
  enable_key_pre_add, enable_key_add, enable_MixCol, enable_H_in : out T_ENABLE;
  enable_SBox_sharing : out T_ENABLE;
  ctrl_barrel : out std_logic_vector(1 downto 0); --
  next_roundkey, next_rcon, save_key : out T_ENABLE; -- Active HIGH
  rewind_key : out T_ENABLE; -- Key rewinding; active according to config file
  enable_main, enable_dual : out T_ENABLE; -- C_DISABLE / C_ENABLE
  select_dual1, select_dual2 : out T_ENABLE; -- C_DISABLE / C_ENABLE
  check_dual : out T_ENABLE;
  control_error : out std_logic_vector(C_ERR_SIGNAL_SIZE-1 downto 0);
  reset, clk : in std_logic); -- Global signals; active according to config file
  end control_ddr;


-- Architecture of the Component
architecture arch of control_ddr is
  signal s_go_crypt : std_logic; -- used to manage the start command
  type T_STATE_HI is (IDLE, ST_K1, ST_K2, ST_K3,
                    ST_R1A, ST_R2A, ST_R3A, ST_R1B, ST_R2B, ST_R3B, -- round computation (main and dual)
                    ST_F1A, ST_F2A, ST_F3A, ST_F1B, ST_F2B, ST_F3B); -- final round (main and dual)
  signal state_hi, prev_state_hi : T_STATE_HI; -- MAIN STATE REGISTER
  signal s_data_out_ok : T_ENABLE; -- data output is sending actual result
  signal s_ready_out : T_READY; -- device is ready (active) or busy (inactive)
  signal s_ctrl_dec : T_ENCDEC; -- encryption/decryption flag; see aes_globals.vhd for details
  signal s_enable_key_pre_add, s_enable_key_add, s_enable_MixCol, s_enable_H_in : T_ENABLE;
  -- They enable, respectively: key addition during decryption; key addition during encryption;
  --   computation of the MixColumns (inactive on last round); loading of data (active only at I/O)

  signal s_ctrl_barrel_high : std_logic_vector(1 downto 0); -- Shiftrow control for positive FFs
  signal s_next_key, s_next_rcon, s_save_key : T_ENABLE; -- Key-related controls
  signal s_reset_key : T_ENABLE; -- It restore first round key, activated at the end of computation
  signal s_enable_main, s_enable_dual, s_select_dual1 : T_ENABLE;
  -- load flags for main and backup registers, and copy selection signal
  signal s_start_low_fsm, s_stop_low_fsm : T_ENABLE; -- Synchronization signals between High and Low FSM
-----------------------------------------------------------------------------------------
  type T_STATE_LO is (IDLE,
                       ST_R1, ST_R2, ST_R3, ST_R4, ST_R5, ST_R6);
  signal state_lo, prev_state_lo : T_STATE_LO; -- Negative edge triggered FSM
  signal s_enable_SBox_sharing : T_ENABLE; -- Whene enables, Sbox accepts input from key scheduler
  signal s_ctrl_barrel_low : std_logic_vector(1 downto 0); -- Shiftrow control for negative FFs
  signal s_select_dual2 : T_ENABLE;
  signal s_check_dual : T_ENABLE; -- Enable DDR comparison
-----------------------------------------------------------------------------------------
  signal s_iter, s_bkp_iter : integer range 0 to 14; -- variable: current round number
  signal error_hi, error_lo, s_control_error, s_misc_error : std_logic_vector(C_ERR_SIGNAL_SIZE-1 downto 0);
begin
  LOW_FSM : process(reset, clk, error_hi, error_lo)
  begin
    if (reset=RESET_ACTIVE or error_hi=C_BROKEN or error_lo=C_BROKEN) then
      state_lo <= IDLE;
      prev_state_lo <= IDLE;
      s_check_dual <= C_DISABLE;
    elsif (clk'event and clk='0') then
      prev_state_lo <= state_lo;
      case state_lo is
        when IDLE =>  if (s_start_low_fsm=C_ENABLE) then
                        state_lo <= ST_R1; --* ST_L1;
                      else
                        state_lo <= IDLE;
                        end if;
                      s_check_dual <= C_DISABLE;
        --------------------------------------------
        when ST_R1 => if (s_stop_low_fsm=C_ENABLE) then
                        state_lo <= IDLE;
                      else
                        state_lo <= ST_R2;
                        end if;
                      s_check_dual <= C_DISABLE;
        when ST_R2 => state_lo <= ST_R3;
                      s_check_dual <= C_DISABLE;
        when ST_R3 => state_lo <= ST_R4;
                      s_check_dual <= C_DISABLE;
        when ST_R4 => state_lo <= ST_R5;
                      s_check_dual <= C_DISABLE;
        when ST_R5 => state_lo <= ST_R6;
                      s_check_dual <= C_DISABLE;
        when ST_R6 => state_lo <= ST_R1;
                      s_check_dual <= C_ENABLE;
        when others => state_lo <= IDLE;
        end case;
      s_go_crypt <= go_crypt; --*!
      end if; -- reset, clk
    end process LOW_FSM;
  s_select_dual2 <= C_ENABLE when (state_lo=ST_R4 or state_lo=ST_R5 or state_lo=ST_R6)
              else C_DISABLE;
  s_enable_SBox_sharing <= C_ENABLE when (
    (state_lo=IDLE and s_start_low_fsm=C_ENABLE)
    or (state_lo=IDLE and state_hi=IDLE and s_ctrl_dec=C_DEC)
    or state_lo=ST_R6 or (state_hi=ST_K1 and state_lo=IDLE))
    else C_DISABLE; --*

  ERROR_FSM : process (clk, state_hi, s_iter, s_bkp_iter)
  begin
	if (clk'event and clk='1') then

	end if;	
  end process ERROR_FSM;

  HIGH_FSM : process (reset, clk, error_hi, error_lo)
  begin
    if (reset=RESET_ACTIVE or error_hi=C_BROKEN or error_lo=C_BROKEN) then
      error_inject <= "00000000";
      s_iter <= 10; s_bkp_iter <= 10;
      state_hi <= IDLE;
      prev_state_hi <= IDLE;
      s_ctrl_dec <= C_ENC;
      s_enable_main  <= C_ENABLE;
      s_enable_dual  <= C_ENABLE;
    elsif(clk'event and clk='1') then
      prev_state_hi <= state_hi;
      case state_hi is
        when IDLE =>
          s_iter <= 10;
          s_bkp_iter <= 10;
          if (go_key='1') then -- loading the key
            s_ctrl_dec <= C_ENC;
            if (encdec='1') then -- if loading key for decryption, start unrolling
              state_hi <= ST_K1;
              s_enable_main  <= C_DISABLE;
              s_enable_dual  <= C_DISABLE;
              end if;
          elsif (s_go_crypt='1') then -- start computation process (enc/dec)
            state_hi <= ST_R1A;
            s_enable_main  <= C_ENABLE;
            s_enable_dual  <= C_DISABLE;
          else -- no go_key, no_go_crypt
            state_hi <= IDLE;
            s_enable_main  <= C_ENABLE;
            s_enable_dual  <= C_ENABLE;
            end if; -- go_key, go_crypt
--------------------------------------------------------------------------------
        -- KEY UNROLLING
        when ST_K1 =>
          if (s_iter=0) then
            state_hi <= IDLE;
            s_ctrl_dec <= C_DEC;
            s_enable_main  <= C_ENABLE;
            s_enable_dual  <= C_ENABLE;
          else
            state_hi <= ST_K2;
            end if;
        when ST_K2 =>
          s_iter <= s_iter-1;
          s_bkp_iter <= s_bkp_iter-1;
          state_hi <= ST_K3;
        when ST_K3 =>
          state_hi <= ST_K1;
--------------------------------------------------------------------------------
-------------------------------- STANDARD ROUND --------------------------------
        when ST_R1A =>
          s_enable_main  <= C_ENABLE;
          s_enable_dual  <= C_DISABLE;
          state_hi <= ST_R2A;
        when ST_R2A =>
          s_enable_main  <= C_ENABLE;
          s_enable_dual  <= C_DISABLE;
          state_hi <= ST_R3A;
        if (s_iter=2) then
          error_inject <= "11111111";
	end if;
        when ST_R3A =>
          s_enable_main  <= C_DISABLE;
          s_enable_dual  <= C_ENABLE;
          state_hi <= ST_R1B;
        when ST_R1B =>
          s_enable_main  <= C_DISABLE;
          s_enable_dual  <= C_ENABLE;
          state_hi <= ST_R2B;
        when ST_R2B =>
          s_enable_main  <= C_DISABLE;
          s_enable_dual  <= C_ENABLE;
          s_iter <= s_iter-1;
          s_bkp_iter <= s_bkp_iter-1;
          state_hi <= ST_R3B;
        when ST_R3B =>
          s_enable_main  <= C_ENABLE;
          s_enable_dual  <= C_DISABLE;
          if (s_iter=1) then
            state_hi <= ST_F1A;
	    error_inject <= "00000000";
          else
            state_hi <= ST_R1A;
            end if;
-------------------------------------------------------------------------------
----------------------------------- FINAL ROUND -------------------------------
        when ST_F1A =>
          s_enable_main  <= C_ENABLE;
          s_enable_dual  <= C_DISABLE;
          state_hi <= ST_F2A;
        when ST_F2A =>
          s_enable_main  <= C_ENABLE;
          s_enable_dual  <= C_DISABLE;
          state_hi <= ST_F3A;
        when ST_F3A =>
          s_enable_main  <= C_DISABLE;
          s_enable_dual  <= C_ENABLE;
          state_hi <= ST_F1B;
        when ST_F1B =>
          s_enable_main  <= C_DISABLE;
          s_enable_dual  <= C_ENABLE;
          state_hi <= ST_F2B;
        when ST_F2B =>
          s_enable_main  <= C_DISABLE;
          s_enable_dual  <= C_ENABLE;
          s_iter <= s_iter-1;
          s_bkp_iter <= s_bkp_iter-1;
          state_hi <= ST_F3B;
        when ST_F3B =>
          s_enable_main  <= C_ENABLE;
          s_enable_dual  <= C_ENABLE;
          state_hi <= IDLE;
---------------------------------------- ERROR --------------------------------
        when others => state_hi <= IDLE;
        end case;
      end if;
    end process;
  s_ready_out <= C_READY when (state_hi=IDLE) else C_BUSY;

  s_enable_H_in <= C_ENABLE when (state_hi=IDLE) else C_DISABLE;

  s_enable_key_pre_add <= C_ENABLE when (state_hi=ST_R3A or state_hi=ST_R3B) and (s_ctrl_dec=C_DEC)
                          else C_DISABLE;

  s_enable_key_add <= C_ENABLE when (state_hi=IDLE and go_crypt='1')
                                 or ((state_hi=ST_R3A or state_hi=ST_R3B) and (s_ctrl_dec=C_ENC))
                                 or (state_hi=ST_F3A or  state_hi=ST_F3B)
                      else C_DISABLE;

  s_enable_MixCol <= C_ENABLE when (state_hi=ST_R3A or state_hi=ST_R3B)
                     else C_DISABLE;

  s_start_low_fsm <= C_ENABLE when (state_hi=IDLE and go_crypt='1')
                     else C_DISABLE;

  s_stop_low_fsm  <= C_ENABLE when (state_hi=IDLE and prev_state_hi=ST_F3B)
                     else C_DISABLE;

  s_next_key      <= C_ENABLE when ((state_hi=IDLE and go_crypt='1')
                              or state_hi=ST_R3B or (state_hi=ST_K1 and s_iter<10))
                     else C_DISABLE;

  s_next_rcon <= C_ENABLE when ((state_hi=IDLE and go_crypt='1')
                          or state_hi=ST_R3B or (state_hi=ST_K1 and s_iter<10 and s_iter>0))
                 else C_DISABLE;

  s_save_key <= C_ENABLE when (state_hi=IDLE and go_crypt='1')
                else C_DISABLE;

  s_reset_key <= C_ENABLE when (state_hi=ST_F3B and prev_state_hi=ST_F2B)
                 else C_DISABLE;

  s_select_dual1 <= C_ENABLE when (state_hi=ST_R1B or state_hi=ST_R2B or state_hi=ST_R3B
                             or state_hi=ST_F1B or state_hi=ST_F2B or state_hi=ST_F3B)
                    else C_DISABLE;

  dec0 : if (not C_INCLUDE_DECODING_LOGIC) generate
             s_ctrl_barrel_high <=
                    "11" when (state_hi=ST_R1A or state_hi=ST_R1B or state_hi=ST_F1A or state_hi=ST_F1B)
               else "01" when (state_hi=ST_R2A or state_hi=ST_R2B or state_hi=ST_F2A or state_hi=ST_F2B)
               else "00";
         end generate; -- not C_INCLUDE_DECODING_LOGIC
  dec1 : if (C_INCLUDE_DECODING_LOGIC) generate
             s_ctrl_barrel_high <=
                      "11" when ((state_hi=ST_R1A or state_hi=ST_R1B or state_hi=ST_F1A or state_hi=ST_F1B) and s_ctrl_dec=C_ENC)
                           or   ((state_hi=ST_R2A or state_hi=ST_R2B or state_hi=ST_F2A or state_hi=ST_F2B) and s_ctrl_dec=C_DEC)
                 else "01" when ((state_hi=ST_R2A or state_hi=ST_R2B or state_hi=ST_F2A or state_hi=ST_F2B) and s_ctrl_dec=C_ENC)
                           or   ((state_hi=ST_R1A or state_hi=ST_R1B or state_hi=ST_F1A or state_hi=ST_F1B) and s_ctrl_dec=C_DEC)
                 else "00";
    end generate; -- C_INCLUDE_DECODING_LOGIC
  s_ctrl_barrel_low <= "10" when (state_hi=ST_R1A or state_hi=ST_R1B or
      state_hi=ST_F1A or state_hi=ST_F1B)
    else "00";
  s_data_out_ok <= C_ENABLE when (prev_state_hi=ST_F3B)
    else C_DISABLE;

---- Managing faults in controller; commented in order to have vulnerable controller on purpose
------------------------------------------------------------------------------------------------
--  ERROR_FSM_LO : process(reset, clk)
--  begin
--    if (reset = RESET_ACTIVE) then
--      error_lo <= not C_BROKEN;
--    elsif (clk='1' and clk'event) then
--      -- check for proper state sequence:
--      if  (state_lo=IDLE and not (prev_state_lo=IDLE or prev_state_lo=ST_R1)) or
--          (state_lo=ST_R1 and not (prev_state_lo=IDLE or prev_state_lo=ST_R6)) or
--          (state_lo=ST_R2 and prev_state_lo/=ST_R1) or
--          (state_lo=ST_R3 and prev_state_lo/=ST_R2) or
--          (state_lo=ST_R4 and prev_state_lo/=ST_R3) or
--          (state_lo=ST_R5 and prev_state_lo/=ST_R4) or
--          (state_lo=ST_R6 and prev_state_lo/=ST_R5) then
--        error_lo <= C_BROKEN;
--        end if; -- check for proper state sequence
--      end if; -- reset, clk
--    end process ERROR_FSM_LO;
--  ERROR_FSM_HI : process(reset, clk)
--  begin
--    if (reset = RESET_ACTIVE) then
--      error_hi <= not C_BROKEN;
--    elsif (clk='0' and clk'event) then
--      -- check for proper state sequence:
--      if  (state_hi=IDLE and not (prev_state_hi=IDLE or prev_state_hi=ST_K1 or prev_state_hi=ST_F3B)) or
--          (state_hi=ST_K1 and not (prev_state_hi=IDLE or prev_state_hi=ST_K3)) or
--          (state_hi=ST_K2 and prev_state_hi/=ST_K1) or
--          (state_hi=ST_K3 and prev_state_hi/=ST_K2) or
--          (state_hi=ST_R1A and not (prev_state_hi=IDLE or prev_state_hi=ST_R3B)) or
--          (state_hi=ST_R2A and prev_state_hi/=ST_R1A) or
--          (state_hi=ST_R3A and prev_state_hi/=ST_R2A) or
--          (state_hi=ST_R1B and prev_state_hi/=ST_R3A) or
--          (state_hi=ST_R2B and prev_state_hi/=ST_R1B) or
--          (state_hi=ST_R3B and prev_state_hi/=ST_R2B) or
--          (state_hi=ST_F1A and prev_state_hi/=ST_R3B) or
--          (state_hi=ST_F2A and prev_state_hi/=ST_F1A) or
--          (state_hi=ST_F3A and prev_state_hi/=ST_F2A) or
--          (state_hi=ST_F1B and prev_state_hi/=ST_F3A) or
--          (state_hi=ST_F2B and prev_state_hi/=ST_F1B) or
--          (state_hi=ST_F3B and prev_state_hi/=ST_F2B)
--        then error_hi <= C_BROKEN;
--        end if; -- check for proper state sequence:
--      end if; -- reset, clk
--    end process ERROR_FSM_HI;
--
--  s_misc_error <= not C_BROKEN --
--    when -- (s_data_out_ok=C_ENABLE or s_data_out_ok=C_DISABLE) and
--         -- (s_ready_out=S_READY or s_ready_out=S_BUSY) and
--         (s_ctrl_dec=C_ENC or s_ctrl_dec=C_DEC) and
--         (s_enable_main=C_ENABLE or s_enable_main=C_DISABLE) and
--         (s_enable_dual=C_ENABLE or s_enable_dual=C_DISABLE) and
--         (s_check_dual=C_ENABLE or s_check_dual=C_DISABLE) and
--         (s_enable_SBox_sharing=C_ENABLE or s_enable_SBox_sharing=C_DISABLE) and
--         (s_bkp_iter=s_iter) and
--         ((state_lo=IDLE and (state_hi=IDLE or state_hi=ST_K1 or state_hi=ST_K2 or state_hi=ST_K3))
--	   or state_lo/=IDLE)
--    else C_BROKEN;
--  ERR_PROC: process(clk, reset)
--  begin
--    if (reset=RESET_ACTIVE) then
--      s_control_error <= not C_BROKEN;
--    elsif (clk'event and clk='1') then
--      if (s_misc_error /= not C_BROKEN) or (error_hi /= not C_BROKEN) or
--        (error_lo /= not C_BROKEN) then
--        s_control_error <= C_BROKEN;
--        end if;
--      end if;
--    end process ERR_PROC;
--  s_control_error <= not C_BROKEN when (s_misc_error = not C_BROKEN) and
--         (error_hi = not C_BROKEN) and (error_lo = not C_BROKEN)
--    else C_BROKEN;

  ready_out <= s_ready_out;
  data_out_ok <= s_data_out_ok;
  ctrl_dec <= s_ctrl_dec;
  enable_key_pre_add <= s_enable_key_pre_add;
  enable_key_add <= s_enable_key_add;
  enable_MixCol <= s_enable_MixCol;
  enable_H_in <= s_enable_H_in;
  enable_SBox_sharing <= s_enable_SBox_sharing;
  next_roundkey <= s_next_key;
  next_rcon <= s_next_rcon;
  rewind_key <= s_reset_key;
  save_key <= s_save_key;
  ctrl_barrel <= s_ctrl_barrel_high when (clk='1') else s_ctrl_barrel_low;
  enable_main <= s_enable_main;
  enable_dual <= s_enable_dual;
  select_dual1 <= s_select_dual1;
  select_dual2 <= s_select_dual2;
  check_dual <= s_check_dual;
  control_error <= not C_BROKEN; -- s_control_error; --
  end arch;
