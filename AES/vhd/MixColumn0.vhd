
library IEEE;
    use IEEE.std_logic_1164.all;
library WORK;
    use WORK.globals.all;

entity mixcolumn0 is port (
    in_0, in_1, in_2, in_3 : in std_logic_vector (7 downto 0);
    ctrl_dec : in T_ENCDEC;
    b_out : out std_logic_vector (7 downto 0) ) ;
    end mixcolumn0;

architecture a_mixcolumn0 of mixcolumn0 is
    component xtime port (
        b_in : in std_logic_vector (7 downto 0);
        b_out : out std_logic_vector (7 downto 0) ) ;
        end component;
    component x2time port (
        b_in : in std_logic_vector (7 downto 0);
        b_out : out std_logic_vector (7 downto 0) ) ;
        end component;
    component x4time port (
        b_in : in std_logic_vector (7 downto 0);
        b_out : out std_logic_vector (7 downto 0) ) ;
        end component;
    signal a, b, c, d, e, f, g, h, i, out_1, out_2 : std_logic_vector (7 downto 0);
begin
    a <= in_0( 7 downto 0 ) xor in_1( 7 downto 0 );
    c <= in_2( 7 downto 0 ) xor in_3( 7 downto 0 );  
    b <= c xor in_1( 7 downto 0 );     
    e <= in_0( 7 downto 0 ) xor in_2( 7 downto 0 );  
    f <= a xor c;        
    xt  : xtime  port map (a, d);
    out_1 <= b xor d;

    gen000e : if ( not C_INCLUDE_DECODING_LOGIC ) generate
      b_out( 7 downto 0 ) <= out_1;  
      end generate;
    gen000d : if ( C_INCLUDE_DECODING_LOGIC ) generate
      x2t : x2time port map (e, g);
      x4t : x4time port map (f, h);
      i <= g xor h;
      out_2 <= out_1 xor i; -- x4time(f) XOR x2time(e) XOR xtime(a) XOR b
      b_out( 7 downto 0 ) <= out_1 when (ctrl_dec = C_ENC) else out_2;  -- out_1 when encryptin, else out_2 when decrypting
      end generate;

end a_mixcolumn0;
