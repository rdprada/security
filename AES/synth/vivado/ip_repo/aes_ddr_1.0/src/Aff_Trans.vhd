 
-- Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- Component Declaration
entity aff_trans is port (
  a : in std_logic_vector (7 downto 0);
  b_out : out std_logic_vector (7 downto 0)   );
  end aff_trans;

architecture a_aff_trans of aff_trans is
begin
   -- Tranformation Process
   b_out(0) <= not (a(0)) xor a(4) xor a(5) xor a(6) xor a(7);
   b_out(1) <= not (a(5)) xor a(0) xor a(1) xor a(6) xor a(7);
   b_out(2) <= a(2) xor a(0) xor a(1) xor a(6) xor a(7);
   b_out(3) <= a(7) xor a(0) xor a(1) xor a(2) xor a(3);
   b_out(4) <= a(4) xor a(0) xor a(1) xor a(2) xor a(3);
   b_out(5) <= not (a(1)) xor a(2) xor a(3) xor a(4) xor a(5);
   b_out(6) <= not (a(6)) xor a(2) xor a(3) xor a(4) xor a(5);
   b_out(7) <= a(3) xor a(4) xor a(5) xor a(6) xor a(7);
  end a_aff_trans;

