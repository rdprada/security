-- Library Declaration
library IEEE;
    use IEEE.std_logic_1164.all;
library WORK;
    use WORK.globals.all;

-----------------------------------------------------------------------
-- The column entity implements all the components needed by a single 
-- column of the AES state:
-- + two linear layer for the first two rows
-- + a DDR register, used to store the first two rows of the state
-- + two other linear layer for the last two rows
-- + another DDR register, used to store the last two rows of the state
-- + the Substitution Box (SBox)
-- The barrel shifter is instantiated in the DataUnit, since it operates
-- on a whole row.
-----------------------------------------------------------------------
    
-- Component Declaration
entity column is port (
  error_inject : in std_logic_vector (7 downto 0);
  in_hi, in_lo : in std_logic_vector (7 downto 0);
  side_in : in std_logic_vector( 31 downto 0 ); -- horizontal input for I/O
  roundkey : in std_logic_vector( 31 downto 0 );
  aux_sbox_in : in std_logic_vector (7 downto 0);
  ctrl_dec : T_ENCDEC;
  enable_key_pre_add, enable_key_add, enable_MixCol, enable_H_in : T_ENABLE;
  enable_SBox_sharing : T_ENABLE;
  enable_main, enable_dual, select_dual1, select_dual2 : in T_ENABLE;
  check_dual : in T_ENABLE;
  clock, reset : in std_logic;
  broken : out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
  side_out : out std_logic_vector( 31 downto 0 );
  aux_sbox_out : out std_logic_vector (7 downto 0);
  b_out : out std_logic_vector (7 downto 0)   );
  end column;

-- Architecture of the Component
architecture a_column of column is
  component DDR_register is
    generic( SIZE : integer := 8 );
    port( 
      din_hi, din_lo : in std_logic_vector( SIZE-1 downto 0 ); --  
      dout_hi, dout_lo : out std_logic_vector( SIZE-1 downto 0 ); 
      rst, clk : in std_logic );
    end component;
  component DDR_dual is
    generic( SIZE : integer := 8 );
    port( 
      din_hi, din_lo : in std_logic_vector( SIZE-1 downto 0 );
      enable_main, enable_dual, select_dual, check_dual : in T_ENABLE;
      dout_hi, dout_lo : out std_logic_vector( SIZE-1 downto 0 ); 
      error_on_diff_hi, error_on_diff_lo : out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
      rst, clk : in std_logic );
    end component;
  component sbox is port (
    b_in : in std_logic_vector (7 downto 0);
    ctrl_dec : T_ENCDEC;
    clock, reset : in std_logic;
    b_out : out std_logic_vector (7 downto 0)   );
    end component;
  component linear is
  generic ( G_ROW : integer range 0 to 3 ); 
  port (
    error_inject : in std_logic_vector (7 downto 0);
    b_in : in std_logic_vector (7 downto 0);
    out_2_mc : out std_logic_vector (7 downto 0);
    in_1, in_2, in_3 : in std_logic_vector (7 downto 0);
    h_in : in std_logic_vector (7 downto 0);
    round_key : in std_logic_vector (7 downto 0);
    ctrl_dec : T_ENCDEC;
    enable_key_pre_add, enable_key_add, enable_MixCol, enable_H_in : T_ENABLE;  
    clock : in std_logic;
    b_out : out std_logic_vector (7 downto 0)   );
    end component;
  component trigger is port (
    switch : in std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 ); 
    clock, reset : in std_logic;
    value : out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 ) );
    end component;
  signal lin_0_in, lin_1_in, lin_2_in, lin_3_in, 
         lin_0_out, lin_1_out, lin_2_out, lin_3_out : std_logic_vector( 7 downto 0 );
  signal out_2_mc_0, out_2_mc_1, out_2_mc_2, out_2_mc_3 : std_logic_vector( 7 downto 0 );
  signal layer_2_out, sbox_in, sbox_out : std_logic_vector( 7 downto 0 );
  signal t_ctrl_dec : T_ENCDEC;
  signal cell_0, cell_1, cell_2, cell_3 : std_logic_vector( 7 downto 0 );
  signal cell_faulty : std_logic_vector( 4*C_ERR_SIGNAL_SIZE-1 downto 0 );
  signal no_error_inject : std_logic_vector( 7 downto 0 );
begin
  lin_0_in <= in_hi;
  lin_1_in <= in_lo;
  no_error_inject <= "00000000";
  -- Here first linear block: rows 0 and 1
  lin_0 : linear generic map ( G_ROW => 0 ) port map(
    error_inject => error_inject,
    b_in => lin_0_in, out_2_mc => out_2_mc_0,
    in_1 => out_2_mc_1, in_2 => out_2_mc_2, in_3 => out_2_mc_3,
    h_in => side_in(31 downto 24),  
    round_key => roundkey(31 downto 24), 
    ctrl_dec => ctrl_dec, 
    enable_key_pre_add => enable_key_pre_add, 
    enable_key_add => enable_key_add, 
    enable_MixCol  => enable_MixCol,  
    enable_H_in    => enable_H_in,     
    clock => clock,
    b_out => lin_0_out );
  lin_1 : linear generic map( G_ROW => 1 ) port map(
    error_inject => no_error_inject,
    b_in => lin_1_in, out_2_mc => out_2_mc_1,
    in_1 => out_2_mc_0, in_2 => out_2_mc_2, in_3 => out_2_mc_3, 
    h_in => side_in(23 downto 16),  
    round_key => roundkey(23 downto 16), 
    ctrl_dec => ctrl_dec, 
    enable_key_pre_add => enable_key_pre_add,
    enable_key_add => enable_key_add,
    enable_MixCol  => enable_MixCol,
    enable_H_in    => enable_H_in,
    clock => clock,
    b_out => lin_1_out );

  ddr_layer_1 : DDR_dual port map( din_hi => lin_0_out, din_lo => lin_1_out,
                                   enable_main => enable_main,
                                   enable_dual => enable_dual,
                                   select_dual => select_dual1,
                                   check_dual => check_dual,
                                   dout_hi => cell_0, dout_lo => cell_1,
                                   error_on_diff_hi => cell_faulty( C_ERR_SIGNAL_SIZE-1 downto 0 ),
                                   error_on_diff_lo => cell_faulty( 2*C_ERR_SIGNAL_SIZE-1 downto C_ERR_SIGNAL_SIZE ),
                                   rst => reset, clk => clock );
  lin_2_in <= cell_0;
  lin_3_in <= cell_1;

  -- Here second linear block: rows 2 and 3
  lin_2 : linear generic map ( G_ROW => 2 ) port map(
    error_inject => no_error_inject,
    b_in => lin_2_in, out_2_mc => out_2_mc_2,
    in_1 => out_2_mc_0, in_2 => out_2_mc_1, in_3 => out_2_mc_3,
    h_in => side_in(15 downto  8),
    round_key => roundkey(15 downto  8),
    ctrl_dec => ctrl_dec,
    enable_key_pre_add => enable_key_pre_add,
    enable_key_add => enable_key_add,
    enable_MixCol  => enable_MixCol,
    enable_H_in    => enable_H_in,
    clock => clock,
    b_out => lin_2_out );
  lin_3 : linear generic map( G_ROW => 3 ) port map(
    error_inject => no_error_inject,
    b_in => lin_3_in, out_2_mc => out_2_mc_3,
    in_1 => out_2_mc_0, in_2 => out_2_mc_1, in_3 => out_2_mc_2,
    h_in => side_in( 7 downto  0),
    round_key => roundkey( 7 downto  0),
    ctrl_dec => ctrl_dec,
    enable_key_pre_add => enable_key_pre_add,
    enable_key_add => enable_key_add,
    enable_MixCol  => enable_MixCol,
    enable_H_in    => enable_H_in,
    clock => clock,
    b_out => lin_3_out );
  ddr_layer_2 : DDR_dual port map( din_hi => lin_2_out, din_lo => lin_3_out,
                                   enable_main => enable_main,
                                   enable_dual => enable_dual,
                                   select_dual => select_dual2,
                                   check_dual => check_dual,
                                   dout_hi => cell_2, dout_lo => cell_3,
                                   error_on_diff_hi => cell_faulty( 3*C_ERR_SIGNAL_SIZE-1 downto 2*C_ERR_SIGNAL_SIZE ),
                                   error_on_diff_lo => cell_faulty( 4*C_ERR_SIGNAL_SIZE-1 downto 3*C_ERR_SIGNAL_SIZE ),
                                   rst => reset, clk => clock );
  layer_2_out <= cell_2 when ( clock='1' ) else cell_3;
  
  -- Here sbox layer
  t_ctrl_dec <= ctrl_dec when ( enable_SBox_sharing = C_DISABLE )
          else c_ENC;
  sbox_in <= layer_2_out when ( enable_SBox_sharing = C_DISABLE )
          else aux_sbox_in;
  i_sbox : sbox port map( sbox_in, t_ctrl_dec,
                          clock, reset, sbox_out );
  aux_sbox_out <= sbox_out;

  b_out <= sbox_out;
  side_out <= cell_0 & cell_1 & cell_2 & cell_3;
  
  ----- ERROR/FAULT MANAGEMENT ------------------------
  broken <= ( not C_BROKEN ) 
      when ( cell_faulty=( not ( C_BROKEN & C_BROKEN & C_BROKEN & C_BROKEN ) ) )
      else C_BROKEN;
  end a_column;
