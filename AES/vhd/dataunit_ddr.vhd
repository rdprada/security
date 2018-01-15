-- Library Declaration
library IEEE;
    use IEEE.std_logic_1164.all;
library WORK;
    use WORK.globals.all;
-----------------------------------------------------------------------
-- DataUnit: this entity contains the actual encryption datapath (the control
-- and the key-related logic are in separate entities). It instantiate:
-- + the four columns making the AES states,
-- + the barrel shifter implementing the ShiftRows operation,
-- + a DDR register layer after the barrel shifter to balance the critical path
-----------------------------------------------------------------------
-- Component Declaration
entity dataunit_ddr is port (
  error_inject : in std_logic_vector (7 downto 0);
  inH : in std_logic_vector( 127 downto 0 );
  key : in std_logic_vector( 127 downto 0 );
  aux_sbox_in : in std_logic_vector(31 downto 0);
  ctrl_dec : in T_ENCDEC;
  enable_key_pre_add, enable_key_add, enable_MixCol, enable_H_in : T_ENABLE;
  enable_SBox_sharing : T_ENABLE;
  ctrl_barrel : in std_logic_vector( 1 downto 0 );
  enable_main, enable_dual, select_dual1, select_dual2 : in T_ENABLE;
  check_dual : in T_ENABLE;
  clock, reset : in std_logic;
  broken: out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
  outH : out std_logic_vector( 127 downto 0 );
  outKey : out std_logic_vector(31 downto 0) );
  end dataunit_ddr;
-- Architecture of the Component
architecture a_dataunit of dataunit_ddr is
  component column is port (
    error_inject : in std_logic_vector (7 downto 0);
    in_hi, in_lo : in std_logic_vector (7 downto 0);
    side_in : in std_logic_vector( 31 downto 0 ); -- horizontal input for I/O
    roundkey : in std_logic_vector( 31 downto 0 );
    aux_sbox_in : in std_logic_vector (7 downto 0);
    ctrl_dec : T_ENCDEC;
    enable_key_pre_add, enable_key_add, enable_MixCol, enable_H_in : T_ENABLE;
    enable_SBox_sharing : T_ENABLE;
    --ctrl_sub : in T_CTRL_SUB;
    enable_main, enable_dual, select_dual1, select_dual2 : in T_ENABLE;
    check_dual : in T_ENABLE;
    clock, reset : in std_logic;
    broken: out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
    side_out : out std_logic_vector( 31 downto 0 );
    aux_sbox_out : out std_logic_vector (7 downto 0);
    b_out : out std_logic_vector (7 downto 0) );
    end component;
  component DDR_register is
    generic( SIZE : integer := 8 );
    port(
      din_hi, din_lo : in std_logic_vector( SIZE-1 downto 0 );
      dout_hi, dout_lo : out std_logic_vector( SIZE-1 downto 0 );
      rst, clk : in std_logic );
    end component;
  component L_barrel is
    generic ( SIZE : integer := 32 );
    port (
      d_in : in std_logic_vector (SIZE-1 downto 0);
      amount : in std_logic_vector (1 downto 0); -- 0 to 3
      d_out : out std_logic_vector (SIZE-1 downto 0) ) ;
    end component;
  component pos_trigger is port (
    switch : in std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
    clock, reset : in std_logic;
    value : out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 ) );
    end component;
  signal column_out, barrel_out, sbox_regs_hi, sbox_regs_lo : std_logic_vector(31 downto 0);
  signal side_data_in, side_data_out : std_logic_vector( 127 downto 0 );
  signal broken_col : std_logic_vector( 4*C_ERR_SIGNAL_SIZE-1 downto 0 );
  signal broken_du : std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
  signal no_error_inject : std_logic_vector( 7 downto 0 );
begin
  side_data_in <= inH;
  no_error_inject <= "00000000";  --*
--  for_col : for I in 0 to 3 generate
    col0 : column port map(
        error_inject( 7 downto 0 ),
        sbox_regs_hi( 7 downto 0 ), sbox_regs_lo( 7 downto 0 ),
        side_data_in( 31 downto 0 ), --*
        key( 31 downto 0 ),
        aux_sbox_in( 7 downto 0 ),
        ctrl_dec,
        enable_key_pre_add, enable_key_add, enable_MixCol,
        enable_H_in, enable_SBox_sharing,
        enable_main, enable_dual, select_dual1, select_dual2, check_dual,
	      clock, reset,
        broken_col( C_ERR_SIGNAL_SIZE-1 downto 0 ),
        side_data_out( 31 downto 0 ), --*
        outKey( 7 downto 0 ),
        column_out( 7 downto 0 ) );
    col1 : column port map(
        no_error_inject( 7 downto 0 ),
        sbox_regs_hi( 15 downto 8 ), sbox_regs_lo( 15 downto 8 ),
        side_data_in( 63 downto 32 ), --*
        key( 63 downto 32 ),
        aux_sbox_in( 15 downto 8 ),
        ctrl_dec,
        enable_key_pre_add, enable_key_add, enable_MixCol,
        enable_H_in, enable_SBox_sharing,
        enable_main, enable_dual, select_dual1, select_dual2, check_dual,
	      clock, reset,
        broken_col( C_ERR_SIGNAL_SIZE*1+C_ERR_SIGNAL_SIZE-1 downto C_ERR_SIGNAL_SIZE ),
        side_data_out( 63 downto 32 ), --*
        outKey( 15 downto 8 ),
        column_out( 15 downto 8 ) );
    col2 : column port map(
        no_error_inject( 7 downto 0 ),
        sbox_regs_hi( 23 downto 16 ), sbox_regs_lo( 23 downto 16 ),
        side_data_in( 95 downto 64 ), --*
        key( 95 downto 64 ),
        aux_sbox_in( 23 downto 16 ),
        ctrl_dec,
        enable_key_pre_add, enable_key_add, enable_MixCol,
        enable_H_in, enable_SBox_sharing,
        enable_main, enable_dual, select_dual1, select_dual2, check_dual,
	      clock, reset,
        broken_col( C_ERR_SIGNAL_SIZE*2+C_ERR_SIGNAL_SIZE-1 downto C_ERR_SIGNAL_SIZE*2 ),
        side_data_out( 95 downto 64 ), --*
        outKey( 23 downto 16 ),
        column_out( 23 downto 16 ) );
    col3 : column port map(
        no_error_inject( 7 downto 0 ),
        sbox_regs_hi( 31 downto 24 ), sbox_regs_lo( 31 downto 24 ),
        side_data_in( 127 downto 96 ), --*
        key( 127 downto 96 ),
        aux_sbox_in( 31 downto 24 ),
        ctrl_dec,
        enable_key_pre_add, enable_key_add, enable_MixCol,
        enable_H_in, enable_SBox_sharing,
        enable_main, enable_dual, select_dual1, select_dual2, check_dual,
	      clock, reset,
        broken_col( C_ERR_SIGNAL_SIZE*3+C_ERR_SIGNAL_SIZE-1 downto C_ERR_SIGNAL_SIZE*3 ),
        side_data_out( 127 downto 96 ), --*
        outKey( 31 downto 24 ),
        column_out( 31 downto 24 ) );
--    end generate;
  barrel_shifter : L_barrel port map( column_out, ctrl_barrel, barrel_out );
  sbox_regs_layer : for I in 0 to 3 generate
    sbox_DDR : DDR_register port map( din_hi=>barrel_out(8*I+7 downto 8*I),
                                      din_lo=>barrel_out(8*I+7 downto 8*I),
                                      dout_hi=>sbox_regs_hi(8*I+7 downto 8*I),
                                      dout_lo=>sbox_regs_lo(8*I+7 downto 8*I),
                                      rst=>reset, clk=>clock );
    end generate; -- for I sbox_regs_layer
  outH <= side_data_out; --*
  broken_du <= not C_BROKEN
    when ( broken_col = not( C_BROKEN & C_BROKEN & C_BROKEN & C_BROKEN ) )
    else C_BROKEN;
  broken <= broken_du;
  end a_dataunit;
