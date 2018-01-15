
-- Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- Component Declaration
entity x_e is port ( 
  a : in std_logic_vector (3 downto 0);
  d : out std_logic_vector (3 downto 0) );
  end x_e;

-- Architecture of the Component
architecture a_x_e of x_e is
begin
   -- Moltiplication Process
   d(3) <= a(3) xor a(2) xor a(1) xor a(0);
   d(2) <= a(2) xor a(1) xor a(0);
   d(1) <= a(1) xor a(0);
   d(0) <= a(3) xor a(2) xor a(1);
  end a_x_e;
