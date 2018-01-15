
library IEEE;
    use IEEE.std_logic_1164.all;
library WORK;
    use WORK.globals.all;

entity mixcolumn is
  generic( G_ROW : integer range 0 to 3 ); 
  port (
    in_0, in_1, in_2, in_3 : in std_logic_vector (7 downto 0);
    ctrl_dec : in T_ENCDEC;
    b_out : out std_logic_vector (7 downto 0) ) ;
    end mixcolumn;

architecture a_mixcolumn of mixcolumn is
  component mixcolumn0 is port (
    in_0, in_1, in_2, in_3 : in std_logic_vector (7 downto 0);
    ctrl_dec : in T_ENCDEC;
    b_out : out std_logic_vector (7 downto 0) ) ;
    end component;
  component PreMcRot is
    generic( G_ROW : integer range 0 to 3 ); 
    port ( 
      in_0, in_1, in_2, in_3 : in std_logic_vector (7 downto 0);
      out_0, out_1, out_2, out_3 : out std_logic_vector (7 downto 0) ) ;
    end component;
  signal t0, t1, t2, t3 : std_logic_vector (7 downto 0);
begin
  -- Rotate inputs accordingly with respect to the actual row index:
  Rot : PreMcRot generic map( G_ROW=>G_ROW ) 
        port map( in_0, in_1, in_2, in_3, t0, t1, t2, t3 );
  -- Compute actual operation:
  MC : mixcolumn0 port map( t0, t1, t2, t3, ctrl_dec, b_out );
end a_mixcolumn;
