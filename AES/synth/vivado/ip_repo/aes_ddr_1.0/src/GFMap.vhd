
-- Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- Component Declaration
entity gfmap is port ( 
   -- a -> Data Input (8 std_logic)
   -- ah -> High Data Output (mapped) (4 std_logic)
   -- al -> Low Data Output (mapped) (4 std_logic)
  a : in std_logic_vector (7 downto 0);
  ah, al : out std_logic_vector (3 downto 0));
  end gfmap;


-- Architecture of the Component
architecture a_gfmap of gfmap is
begin
   -- Mapping Process
   ah(3) <= a(5) xor a(7);
   ah(2) <= a(5) xor a(7) xor a(2) xor a(3);
   ah(1) <= a(1) xor a(7) xor a(4) xor a(6);
   ah(0) <= a(4) xor a(6) xor a(5);

   al(3) <= a(2) xor a(4);
   al(2) <= a(1) xor a(7);
   al(1) <= a(1) xor a(2);
   al(0) <= a(4) xor a(6) xor a(5) xor a(0);
  end a_gfmap;

