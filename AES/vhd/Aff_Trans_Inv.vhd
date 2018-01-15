
 
-- Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- Component Declaration
entity aff_trans_inv is port (
  a : in std_logic_vector (7 downto 0);
  b_out : out std_logic_vector (7 downto 0)   );
  end aff_trans_inv;

-- Architecture of the Component
architecture a_aff_trans_inv of aff_trans_inv is
begin
   -- Tranformation Process
   b_out(0) <= not (a(5)) xor a(2) xor a(7);
   b_out(1) <= a(0) xor a(3) xor a(6);
   b_out(2) <= not (a(7)) xor a(1) xor a(4);
   b_out(3) <= a(2) xor a(0) xor a(5);
   b_out(4) <= a(1) xor a(3) xor a(6);
   b_out(5) <= a(4) xor a(2) xor a(7);
   b_out(6) <= a(3) xor a(0) xor a(5);
   b_out(7) <= a(1) xor a(4) xor a(6);
  end a_aff_trans_inv;
