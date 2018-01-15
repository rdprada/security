library ieee;
use ieee.std_logic_1164.all;


entity sboxtb is
end entity sboxtb;


architecture behavioral of sboxtb is

  signal m  : std_logic_vector( 7 downto 0 );
  signal k  : std_logic_vector( 7 downto 0 );
  signal c  : std_logic_vector( 7 downto 0 );
  signal clk : std_logic;
  signal rst : std_logic;
  constant clk_half_period : integer := 10;
  constant clk_period : integer := 2*clk_half_period;  
  
component sbox
  port
  (
    m  : in  std_logic_vector( 7 downto 0 );
    k  : in  std_logic_vector( 7 downto 0 );
    c  : out std_logic_vector( 7 downto 0 );
    clk : in std_logic;
    rst : in std_logic
  );
end component ;

begin

 process
begin
	clk <= '1';
       	wait for clk_half_period * 1 ns;
	clk <= '0';
       	wait for clk_half_period * 1 ns;
end process;
SB : sbox
  port map (
    m => m,
    c => c,
    k => k,
    rst => rst,
    clk => clk
  );

process
begin

  -- T = 0ns
  m <= "00000000";  
  k <= "00000000";
  rst <= '1';

  wait for clk_period * 1 ns;

  -- T = 20ns
  m <= "00000000";  
  k <= "00000000";
  rst <= '0';

  wait for clk_period * 1 ns;  

  -- T = 40ns
  m <= "00000001";  
  k <= "00000000";
  rst <= '0';

  wait for clk_period * 1 ns;  

  -- T = 50ns
  m <= "00000011";  
  k <= "00000000";
  rst <= '0';

  wait for clk_period * 1 ns;  

  -- T = 60ns
  m <= "00000111";  
  k <= "00000000";
  rst <= '0';

  wait for clk_period * 1 ns;  

  -- T = 70ns
  m <= "00001111";  
  k <= "00000000";
  rst <= '0';

  wait for clk_period * 1 ns;  

  -- T = 80ns
  m <= "00011111";  
  k <= "00000000";
  rst <= '0';

  wait for clk_period * 1 ns;  

  -- T = 90ns
  m <= "00000000";  
  k <= "00000000";
  rst <= '0';

  wait for clk_period * 1 ns;  

  -- T = 100ns
  m <= "00000000";  
  k <= "00000000";
  rst <= '0';

  wait for clk_period * 1 ns;  

  -- T = 110ns
  m <= "00000000";  
  k <= "00000000";
  rst <= '0';

  wait for clk_period * 1 ns;  

  -- T = 120ns
  m <= "00000000";  
  k <= "00000000";
  rst <= '0';

  wait for clk_period * 1 ns;  



end process;

end behavioral;
