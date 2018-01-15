
-- Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;

-----------------------------------------------------------------------
-- Entity implementing shiftrow operation. 
-- amount<0> controls rotation by one byte to the left
-- amount<1> controls rotation by two bytes
-- Input size configurable through generic parameter SIZE
-----------------------------------------------------------------------

-- Component Declaration
entity L_barrel is
  generic ( SIZE : integer := 32 ); 
  port ( 
    d_in : in std_logic_vector (SIZE-1 downto 0);
    amount : in std_logic_vector (1 downto 0); -- 0 to 3
    d_out : out std_logic_vector (SIZE-1 downto 0) ) ;
  end L_barrel;

-- Architecture of the Component
architecture a_L_barrel of L_barrel is
  signal inner : std_logic_vector (SIZE-1 downto 0);
begin
  inner <= d_in( SIZE/4*3-1 downto 0 ) & d_in( SIZE-1 downto SIZE/4*3 ) 
      when ( amount(0)='1' ) else d_in;
  d_out <= inner( SIZE/2-1 downto 0 ) & inner( SIZE-1 downto SIZE/2 ) 
      when ( amount(1)='1' ) else inner;
  end a_L_barrel;
