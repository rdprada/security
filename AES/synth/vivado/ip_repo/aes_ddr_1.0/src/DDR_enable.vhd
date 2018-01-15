library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
library WORK;
  use WORK.globals.all;

entity DDR_enable is
  generic( SIZE : integer := 8 );
  port( 
    din_hi, din_lo : in std_logic_vector( SIZE-1 downto 0 );
    enable : in T_ENABLE;
    dout_hi, dout_lo : out std_logic_vector( SIZE-1 downto 0 ); 
    rst, clk : in std_logic );
  end DDR_enable;

architecture small of DDR_enable is
  signal high_data, low_data : std_logic_vector( SIZE-1 downto 0 );
begin
  HIGH_FRONT_PROC : process( rst, clk )
  begin
    if ( rst=RESET_ACTIVE ) then
      high_data <= ( others=>'0' );
    elsif ( clk'event and clk='1' ) then
      if ( enable/=C_DISABLE ) then  -- v. 1.2	
        high_data <= din_hi;
        end if;
      end if; -- rst, clk
    end process; -- HIGH_FRONT_PROC

  LOW_FRONT_PROC : process( rst, clk )
  begin
    if ( rst=RESET_ACTIVE ) then
      low_data <= ( others=>'0' );
    elsif ( clk'event and clk='0' ) then
      if ( enable/=C_DISABLE ) then  -- v. 1.2	
        low_data <= din_lo;
        end if;
      end if; -- rst, clk
    end process; -- HIGH_FRONT_PROC

  dout_hi <= high_data;
  dout_lo <= low_data;
  end small;
