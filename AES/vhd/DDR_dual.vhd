library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
library WORK;
  use WORK.globals.all;

entity DDR_dual is
  generic( SIZE : integer := 8 );
  port( 
    din_hi, din_lo : in std_logic_vector( SIZE-1 downto 0 );
    enable_main, enable_dual, select_dual, check_dual : in T_ENABLE;
    dout_hi, dout_lo : out std_logic_vector( SIZE-1 downto 0 );
    error_on_diff_hi, error_on_diff_lo : out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 );
    rst, clk : in std_logic );
  end DDR_dual;

architecture a_ddr_dual of DDR_dual is
  component DDR_enable is
    generic( SIZE : integer := 8 );
    port( 
      din_hi, din_lo : in std_logic_vector( SIZE-1 downto 0 );
      enable : in T_ENABLE;
      dout_hi, dout_lo : out std_logic_vector( SIZE-1 downto 0 ); 
      rst, clk : in std_logic );
    end component;
  component trigger is port (
    switch : in std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 ); 
    clock, reset : in std_logic;
    value : out std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 ) );
    end component;
  signal main_hi, main_lo, dual_hi, dual_lo, diff_hi, diff_lo, hi, lo : std_logic_vector( SIZE-1 downto 0 );
begin
  main_reg : DDR_enable generic map( SIZE=>SIZE )
                        port map( din_hi=>din_hi, din_lo=>din_lo,
                          enable=>enable_main,
                          dout_hi=>main_hi, dout_lo=>main_lo,
                          rst=>rst, clk=>clk );
  dual_reg : DDR_enable generic map( SIZE=>SIZE )
                        port map( din_hi=>din_hi, din_lo=>din_lo,
                          enable=>enable_dual,
                          dout_hi=>dual_hi, dout_lo=>dual_lo,
                          rst=>rst, clk=>clk );
  
  diff_hi <= main_hi xor dual_hi; --*
  diff_lo <= main_lo xor dual_lo; --*
  
  hi <= main_hi when ( select_dual=C_DISABLE ) else dual_hi;
  lo <= main_lo when ( select_dual=C_DISABLE ) else dual_lo;
  
  dout_hi <= ( hi xor diff_hi ) when ( check_dual=C_ENABLE ) else hi;
  dout_lo <= ( lo xor diff_lo ) when ( check_dual=C_ENABLE ) else lo;
  
  -- Error triggers, each pair of FFs is checked on the opposite clock edge
  -- (e.g., positive FFs are compared on falling clock edge)
  P_ERR_HI : process( clk, rst )
  begin
    if ( rst=RESET_ACTIVE ) then
      error_on_diff_hi <= not C_BROKEN;
    elsif ( clk='0' and clk'event ) then
      if ( check_dual=C_ENABLE ) then
        if ( unsigned(diff_hi) /= 0 ) then
          error_on_diff_hi <= C_BROKEN;
          end if; -- compare 
        end if; -- check_dual
      end if; -- clk, rst
    end process P_ERR_HI;
  P_ERR_LO : process( clk, rst )
  begin
    if ( rst=RESET_ACTIVE ) then
      error_on_diff_lo <= not C_BROKEN;
    elsif ( clk='1' and clk'event ) then
      if ( check_dual=C_ENABLE ) then
        if ( unsigned(diff_lo) /= 0 ) then
          error_on_diff_lo <= C_BROKEN;
          end if; -- compare 
        end if; -- check_dual
      end if; -- clk, rst
    end process P_ERR_LO;
  end a_ddr_dual;
