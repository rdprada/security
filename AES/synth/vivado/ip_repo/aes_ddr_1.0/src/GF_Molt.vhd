
-- Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- Component Declaration
entity gf_molt is port ( 
  a, b: in std_logic_vector (3 downto 0);
  d : out std_logic_vector (3 downto 0));
  end gf_molt;

-- Architecture of the Component
architecture a_gf_molt of gf_molt is
begin
   -- Moltiplication Process
   d(3) <= (a(0) and b(3)) xor (a(1) and b(2)) xor (a(2) and b(1)) xor (a(3) and b(0)) xor (a(3) and b(3));
   d(2) <= (a(0) and b(2)) xor (a(1) and b(1)) xor (a(2) and b(0)) xor (a(2) and b(3)) xor (a(3) and b(2)) xor (a(3) and b(3));
   d(1) <= (a(0) and b(1)) xor (a(1) and b(0)) xor (a(2) and b(3)) xor (a(3) and b(2)) xor (a(1) and b(3)) xor (a(2) and b(2)) xor (a(3) and b(1));
   d(0) <= (a(0) and b(0)) xor (a(1) and b(3)) xor (a(2) and b(2)) xor (a(3) and b(1));
  end a_gf_molt;


