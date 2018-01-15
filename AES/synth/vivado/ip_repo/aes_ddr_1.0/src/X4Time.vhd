
-- Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- Component Declaration
entity x4time is port ( 
  b_in : in std_logic_vector (7 downto 0);
  b_out : out std_logic_vector (7 downto 0) ) ;
  end x4time;

-- Architecture of the Component
architecture a_x4time of x4time is
begin
    b_out(7) <= b_in(4);
    b_out(6) <= b_in(3) xor b_in(7);
    b_out(5) <= b_in(2) xor b_in(6) xor b_in(7);
    b_out(4) <= b_in(1) xor b_in(5) xor b_in(6);
    b_out(3) <= b_in(0) xor b_in(5) xor b_in(7);
    b_out(2) <= b_in(6) xor b_in(7);
    b_out(1) <= b_in(5) xor b_in(6);
    b_out(0) <= b_in(5);
    end a_x4time;
