
library IEEE;
    use IEEE.std_logic_1164.all;
library WORK;
    use WORK.globals.all;

entity rcon is port (
    next_value : in T_ENABLE;  -- to be connected to next_rcon from controller
    ctrl_dec : in T_ENCDEC;
    reset, clock : in std_logic;
    rcon_byte : out std_logic_vector (7 downto 0);
    reset_key : in T_ENABLE;
    last_key : in T_ENABLE);
    end rcon;

architecture a_rcon of rcon is
    signal rc_reg, s_next_rc, s_last_rcon : std_logic_vector( 7 downto 0 );
begin
    SAVE_RCON_PROC : process( clock, reset )
    begin
      if ( reset=RESET_ACTIVE ) then
        s_last_rcon <= "00000001"; 
      elsif ( clock'event and clock='1' ) then
        if (last_key = C_ENABLE) then
          s_last_rcon <= rc_reg;
          end if; -- nextval
        end if;
      end process SAVE_RCON_PROC;

    process( clock, reset, reset_key, last_key )
    begin
      if ( reset=RESET_ACTIVE ) then
        rc_reg <= "00000001"; 
      elsif ( clock'event and clock='1' ) then
        if ( next_value/=C_DISABLE ) then  -- v. 1.2
	  rc_reg <= s_next_rc;
        elsif ( reset_key = C_ENABLE ) then
          rc_reg <= s_last_rcon;
          end if; -- nextval
        end if; -- reset, clock
      end process;

  idec : if ( C_INCLUDE_DECODING_LOGIC ) generate
    s_next_rc <= ( rc_reg(6 downto 0) & '0' ) xor ( "000" & rc_reg(7) & rc_reg(7) & '0' & rc_reg(7) & rc_reg(7) )
      when ( ctrl_dec = C_ENC ) 
      else ( '0' & rc_reg(7 downto 1) ) xor ( rc_reg(0) & "000" & rc_reg(0) & rc_reg(0) & '0' & rc_reg(0) );
    end generate; -- C_INCLUDE_DECODING_LOGIC
  ienc : if ( not C_INCLUDE_DECODING_LOGIC ) generate
    s_next_rc(7 downto 5) <= rc_reg(6 downto 4);
    s_next_rc(4 downto 3) <= rc_reg(3 downto 2) xor ( rc_reg(7) & rc_reg(7) );
    s_next_rc(2) <= rc_reg(1);
    s_next_rc(1) <= rc_reg(0) xor rc_reg(7);
    s_next_rc(0) <= rc_reg(7);
    end generate; -- not C_INCLUDE_DECODING_LOGIC

  rcon_byte <= rc_reg;
  end a_rcon;

