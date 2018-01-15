

-- Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- Component Declaration
entity quadrato is port ( 
  a : in std_logic_vector (3 downto 0);
  d : out std_logic_vector (3 downto 0));
  end quadrato;


-- Architecture of the Component
architecture a_quadrato of quadrato is
begin
   -- Square Process
   d(3) <= a(3);
   d(2) <= a(3) xor a(1);
   d(1) <= a(2);
   d(0) <= a(2) xor a(0);
  end a_quadrato;

