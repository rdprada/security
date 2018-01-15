
-- Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- Component Declaration
entity gfmapinv is port (
   -- ah -> High Data Input (4 std_logic)
   -- al -> Low Data Input (4 std_logic)
   -- a -> Data Output (remapped back) (8 std_logic)
  ah, al : in std_logic_vector (3 downto 0);
  a : out std_logic_vector (7 downto 0)   );
  end gfmapinv;

-- Architecture of the Component
architecture a_gfmapinv of gfmapinv is
begin
   -- Inverse Mapping Process
   a(0) <= al(0) xor ah(0);
   a(1) <= ah(0) xor ah(1) xor ah(3);
   a(2) <= al(1) xor ah(3) xor ah(0) xor ah(1);
   a(3) <= ah(0) xor ah(1) xor al(1) xor ah(2);
   a(4) <= al(1) xor ah(3) xor ah(0) xor ah(1) xor al(3);
   a(5) <= ah(0) xor ah(1) xor al(2);
   a(6) <= al(1) xor ah(3) xor al(2) xor al(3) xor ah(0);
   a(7) <= ah(0) xor ah(1) xor al(2) xor ah(3);
  end a_gfmapinv;
