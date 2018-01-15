------------------------------------------------------
------------------------------------------------------

library IEEE;
    use IEEE.std_logic_1164.all;
library WORK;
    use WORK.globals.all;

entity aes_core is port (
    data_inH : in std_logic_vector( 127 downto 0 );   
    input_key : in std_logic_vector( 127 downto 0 ); 
    go_cipher, go_key, enc_command : in std_logic;   
    data_outH : out std_logic_vector( 127 downto 0 ); 
    data_out_ok : out std_logic; 
    ready_out : out std_logic;
    error : out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
    rst, ck : in std_logic   ); 
    end aes_core;


-- Architecture of the Component
architecture arch of aes_core is
  component dataunit_ddr is port (
    error_inject : in std_logic_vector (7 downto 0);
    inH : in std_logic_vector( 127 downto 0 ); 
    key : in std_logic_vector( 127 downto 0 ); 
    aux_sbox_in : in std_logic_vector(31 downto 0);
    ctrl_dec : in T_ENCDEC; 
    enable_key_pre_add, enable_key_add, enable_MixCol, enable_H_in : in T_ENABLE;
    enable_SBox_sharing : in T_ENABLE;
    ctrl_barrel : in std_logic_vector( 1 downto 0 );
    enable_main, enable_dual, select_dual1, select_dual2 : in T_ENABLE;
    check_dual : in T_ENABLE;
    clock, reset : in std_logic; 
    broken: out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
    outH : out std_logic_vector( 127 downto 0 );
    outKey : out std_logic_vector(31 downto 0) );
    end component;
  component control_ddr is port (
    error_inject : out std_logic_vector (7 downto 0);
    go_crypt, go_key : in std_logic; -- active HIGH 
    encdec : in std_logic;       -- 0=encrypt, 1=decrypt
    --key_size : in std_logic_vector( 1 downto 0 ); -- 01=128, 10=192, 11=256
    ready_out : out T_READY;     -- device state: S_READY or S_BUSY
    data_out_ok : out T_ENABLE; -- Validity bit for the output
    ctrl_dec : out T_ENCDEC;     -- S_ENC / S_DEC
    enable_key_pre_add, enable_key_add, enable_MixCol, enable_H_in : out T_ENABLE;
    enable_SBox_sharing : out T_ENABLE;
    ctrl_barrel : out std_logic_vector( 1 downto 0 ); -- 
    next_roundkey, next_rcon, save_key : out T_ENABLE; -- Active HIGH
    rewind_key : out T_ENABLE; -- Key rewinding; active according to config file
    enable_main, enable_dual : out T_ENABLE; -- C_DISABLE / C_ENABLE
    select_dual1, select_dual2 : out T_ENABLE; -- C_DISABLE / C_ENABLE
    check_dual : out T_ENABLE; -- C_DISABLE / C_ENABLE
    control_error : out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
    reset, clk : in std_logic ); -- Global signals; active according to config file
    end component;
  component keyunit is port (
    key_in : in std_logic_vector (127 downto 0);
    in_ready : in T_READY;
    load_key : in std_logic;
    advance_key : in T_ENABLE; -- next_step
    reset_key : in T_ENABLE; -- rewind
    save_key : in T_ENABLE; -- checkpoint: saved key for later rewind
    ctrl_dec : in T_ENCDEC;
    next_rcon : in T_ENABLE; -- next_step 
    reset, clk : in std_logic;
    data_to_sbox : out std_logic_vector (31 downto 0); -- data to DU's Sboxes
    data_from_sbox: in std_logic_vector (31 downto 0); --- data from DU's Sboxes
    key_out : out std_logic_vector (127 downto 0) ); -- ROUND KEY
    end component;
  -- Data signals: -------------------------------------------------------------
  signal s_data_in_H, s_data_out_H : std_logic_vector( 127 downto 0 );
  signal s_round_key  : std_logic_vector( 127 downto 0 );
  signal s_KS_to_DU, s_DU_to_KS : std_logic_vector( 31 downto 0 );
  -- Control signals: ----------------------------------------------------------
  signal s_ready : T_READY;
  signal s_data_out_ok : T_ENABLE;
  signal s_go_key : std_logic;
  signal s_go_crypt : std_logic;
  signal s_ctrl_dec : T_ENCDEC;
  signal s_enable_key_pre_add, s_enable_key_add, s_enable_MixCol, 
         s_enable_H_in, s_enable_SBox_sharing : T_ENABLE;
  signal s_ctrl_barrel : std_logic_vector( 1 downto 0 );
  signal s_enable_main, s_enable_dual, s_select_dual1, s_select_dual2, s_check_dual : T_ENABLE;
  signal s_control_error, s_broken: std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
  signal s_advance_round_key, s_advance_rcon, s_save_key, s_rewind_key : T_ENABLE;
  signal s_error_inject : std_logic_vector( 7 downto 0 );
begin
  s_go_crypt <= go_cipher; 
  s_go_key   <= go_key; 
  
  s_data_in_H <= data_inH;
  DU : dataunit_ddr port map(
	error_inject => s_error_inject,
        inH => s_data_in_H, 
        key => s_round_key, 
        aux_sbox_in => s_KS_to_DU,
        ctrl_dec => s_ctrl_dec,
        enable_key_pre_add => s_enable_key_pre_add,
        enable_key_add => s_enable_key_add,
        enable_MixCol => s_enable_MixCol, 
        enable_H_in => s_enable_H_in,
        enable_SBox_sharing => s_enable_SBox_sharing,
        ctrl_barrel => s_ctrl_barrel,
        enable_main => s_enable_main, 
        enable_dual => s_enable_dual, 
        select_dual1 => s_select_dual1, 
        select_dual2 => s_select_dual2,
	      check_dual => s_check_dual,
        clock => ck,
        reset => rst, 
        broken => s_broken,
        outH => s_data_out_H,
        outKey => s_DU_to_KS ); 
  CU : control_ddr port map( 
        error_inject => s_error_inject,
        go_crypt => s_go_crypt, 
        go_key => s_go_key, 
        encdec => enc_command,
        ready_out => s_ready,
        data_out_ok => s_data_out_ok,
        ctrl_dec => s_ctrl_dec,
        enable_key_pre_add => s_enable_key_pre_add,
        enable_key_add => s_enable_key_add,
        enable_MixCol => s_enable_MixCol,
        enable_H_in => s_enable_H_in,
        enable_SBox_sharing => s_enable_SBox_sharing,
        ctrl_barrel => s_ctrl_barrel,
        next_roundkey => s_advance_round_key, 
        next_rcon => s_advance_rcon, --*
        save_key => s_save_key,
        rewind_key => s_rewind_key,
        enable_main => s_enable_main, 
        enable_dual => s_enable_dual, 
        select_dual1 => s_select_dual1, 
        select_dual2 => s_select_dual2,
	      check_dual => s_check_dual,
	      control_error => s_control_error,
        reset => rst, 
        clk => ck ); 
  KU : keyunit port map(
        key_in => input_key,
        in_ready => s_ready,
        load_key => s_go_key,
        advance_key => s_advance_round_key,
        reset_key => s_rewind_key,
        save_key => s_save_key,
        ctrl_dec => s_ctrl_dec,
        next_rcon => s_advance_rcon, 
        reset => rst, 
        clk => ck,
        data_to_sbox => s_KS_to_DU,  
        data_from_sbox => s_DU_to_KS, 
        key_out => s_round_key  ); 
        
  -- DATA OUT PROCESS ----------------------------------------------------------
  -- Latch (transparent on high clock) to filter DDR data
  DATA_OUT_PROCESS : process( ck )
  begin
    if ( ck'event and ck='0' ) then
      if ( s_data_out_ok=C_ENABLE ) then
        data_outH <= s_data_out_H;
        data_out_ok <= '1';
      else
        data_outH <= ( others => '0' );
        data_out_ok <= '0';
        end if;
      end if;
    end process DATA_OUT_PROCESS;
  ready_out <= '0' when ( s_ready=C_BUSY ) else '1';
  error <= ( not C_BROKEN ) 
    when ( s_broken = not C_BROKEN ) and 
         ( s_control_error = not C_BROKEN ) 
    else C_BROKEN;
  end arch;
