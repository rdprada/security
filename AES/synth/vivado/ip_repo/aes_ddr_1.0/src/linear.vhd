-- Library Declaration
library IEEE;
    use IEEE.std_logic_1164.all;
library WORK;
    use WORK.globals.all;

-----------------------------------------------------------------------
-- Linear layer of the AES: 
-- + key addition when deciphering
-- + mixcolumns operation
-- + stabilization layer for synchronization
-- + key addition during loading and encryption
-----------------------------------------------------------------------
    
-- Component Declaration
entity linear is
  generic ( G_ROW : integer range 0 to 3 ); 
  port (
    error_inject : in std_logic_vector (7 downto 0);
    b_in : in std_logic_vector (7 downto 0);
    out_2_mc : out std_logic_vector (7 downto 0);
    in_1, in_2, in_3 : in std_logic_vector (7 downto 0);
    h_in : in std_logic_vector (7 downto 0);
    round_key : in std_logic_vector (7 downto 0);
    ctrl_dec : T_ENCDEC;
    enable_key_pre_add, enable_key_add, enable_MixCol, enable_H_in : T_ENABLE;
    clock : in std_logic;
    b_out : out std_logic_vector (7 downto 0)   );
    end linear;

-- Architecture of the Component
architecture a_linear of linear is
  component mixcolumn is
  generic( G_ROW : integer range 0 to 3 ); 
  port (
    in_0, in_1, in_2, in_3 : in std_logic_vector (7 downto 0);
    ctrl_dec : in T_ENCDEC;
    b_out : out std_logic_vector (7 downto 0) ) ;
    end component;
  signal data_in, mc_out, addkey_in, key_in_post_mc, addkey_out_post_mc : std_logic_vector (7 downto 0);
  signal mc_input, key_in_pre_mc : std_logic_vector (7 downto 0);
begin
  dec0 : if ( not C_INCLUDE_DECODING_LOGIC ) generate
    mc_input <= b_in; 
    end generate; -- not C_INCLUDE_DECODING_LOGIC
  dec1 : if ( C_INCLUDE_DECODING_LOGIC ) generate
    key_in_pre_mc <= round_key when ( enable_key_pre_add = C_ENABLE ) else ( others=>'0' );
    mc_input <= b_in xor key_in_pre_mc;
    end generate; -- C_INCLUDE_DECODING_LOGIC

  out_2_mc <= mc_input;
  mc : mixcolumn generic map( G_ROW ) 
                 port map( mc_input, in_1, in_2, in_3,
    	                     ctrl_dec, mc_out );

  data_in <= b_in when ( enable_H_in = C_DISABLE ) else h_in; 
  
  --- STABILIZATION OF DATA
  STAB_PROC : process( clock, mc_out, enable_MixCol, data_in  )
  begin
    if ( clock='1' ) then
      if ( enable_MixCol = C_ENABLE ) then 
        addkey_in <= mc_out xor error_inject; 
      else 
        addkey_in <= data_in; 
        end if; 
      end if; -- clock
    end process STAB_PROC;

  key_in_post_mc <= round_key when ( enable_key_add = C_ENABLE ) else ( others=>'0' ); 
  addkey_out_post_mc <=  addkey_in xor key_in_post_mc; 
  b_out <= addkey_out_post_mc;  

  end a_linear;
