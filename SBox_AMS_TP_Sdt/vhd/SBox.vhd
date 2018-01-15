
library ieee;
use ieee.std_logic_1164.all;

entity sbox is
  port
  (
    m  : in  std_logic_vector( 7 downto 0 );
	k  : in  std_logic_vector( 7 downto 0 );
    c  : out std_logic_vector( 7 downto 0 );
    clk : in std_logic;
	rst : in std_logic
  );
end entity sbox;

architecture behavioral of sbox is
  signal reg, n_reg: std_logic_vector( 7 downto 0 ); 
begin


seq : process( clk, rst )
    begin
      if rst = '1' then
        reg <= ( others => '0' );
      elsif rising_edge( clk ) then
        reg <= n_reg;
      end if;
    end process;

comb : process( m, k )	
	variable sboxout : std_logic_vector( 7 downto 0 );
	variable mk : std_logic_vector( 7 downto 0 );
	begin
		mk := m xor k;
		sboxout(7):=(
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7))
		);
		sboxout(6):=(
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7))
		);
		sboxout(5):=(
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7))
		);
		sboxout(4):=(
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) 
		);
		sboxout(3):=(
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7))
		);
		sboxout(2):=(
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) 
		);
		sboxout(1):=(
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) 
		);
		sboxout(0):=(
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and not mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and not mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and not mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and not mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and     mk(2) and     mk(3) and not mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and     mk(2) and not mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and not mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			(     mk(0) and     mk(1) and not mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7)) or
			( not mk(0) and     mk(1) and     mk(2) and     mk(3) and     mk(4) and     mk(5) and     mk(6) and     mk(7))
		);

	  n_reg <= sboxout;
	end process;


output : c <= reg;

end architecture behavioral;
