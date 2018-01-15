-- Library Declaration
library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
library lib_aes;
  use lib_aes.all;

------------------------------------------------------------------------
-- This test bench is configured with two different data sets (selectable with
-- <seltest>). Each test can be run in encryption or decryption flow.
-- Then check the signals at the output of the instantiated core.
------------------------------------------------------------------------
  
-- Component Declaration
entity test_core is 
    end test_core;
    
--constant C_ERROR_SIGNAL_WIDTH : integer := 2;

-- Architecture of the Component
architecture a_tb of test_core is
  constant RESET_ACTIVE : std_logic := '0';
  constant CLK_HT : time := 16 ns;
  signal go_enc : std_logic := '0';
  signal go_dec : std_logic := '1';
  component aes_core is port (
    data_inH : in std_logic_vector( 127 downto 0 ); 
    input_key : in std_logic_vector( 127 downto 0 );
    go_cipher, go_key, enc_command : in std_logic; 
    data_outH : out std_logic_vector( 127 downto 0 );
    data_out_ok : out std_logic; 
    ready_out : out std_logic;
    error : out std_logic_vector( 0 downto 0 );
    rst, ck : in std_logic   ); 
    end component; 
  signal datain : std_logic_vector( 127 downto 0 );
  signal data, edata, edata1, edata2, ddata, ddata1, ddata2, kdata1, kdata2 : std_logic_vector( 127 downto 0 );
  signal input_key : std_logic_vector(127 downto 0);
  signal s_broken: std_logic_vector( 0 downto 0 ); -- Verify that it is C_ERROR_SIGNAL_WIDTH bit wide!
  signal seltest : integer;
  signal rst, ck, s_ready, s_d_ok : std_logic;
  signal dout : std_logic_vector (127 downto 0);
  signal s_go_crypt, s_go_key, s_command : std_logic;
begin
  -- CHANGE THE TWO LINES BELOW ACCORDING TO THE TEST YOU WANT TO EXECUTE 
  -- AND WHETHER YOU NEED TO TEST ENCRYPTION OR DECRYPTION:
  seltest <= 1; -- 1 for "test 1" or anything else for "test 2"
  s_command <= go_enc; -- "go_enc" or "go_dec"
  
  -- Reset and clock generation:
  rst <= not( RESET_ACTIVE ), RESET_ACTIVE after 50*CLK_HT, not( RESET_ACTIVE ) after 52*CLK_HT;
  clk_pr : process
  begin   
    ck <= '1';
    loop
      wait for CLK_HT;
      ck <= not ck;
      end loop;
    end process;

  -- Input definition
  edata1 <= X"3243f6a8885a308d313198a2e0370734";  edata2 <= X"00112233445566778899aabbccddeeff";
  kdata1 <= X"2b7e151628aed2a6abf7158809cf4f3c";  kdata2 <= X"000102030405060708090a0b0c0d0e0f";
  ddata1 <= X"3925841d02dc09fbdc118597196a0b32";  ddata2 <= X"69c4e0d86a7b0430d8cdb78070b4c55a";
           -- ------------------------XX------
           -- 3925841d02dc09fbdc118597df6a0b32
  input_key <= kdata1 when ( seltest=1 ) else kdata2;
  edata  <= edata1 when ( seltest=1 ) else edata2;
  ddata  <= ddata1 when ( seltest=1 ) else ddata2;
  data <= edata when ( s_command=go_enc ) else ddata;

  datain <= ( others=>'0' ), data after 128*CLK_HT, 
            ( others=>'0' ) after 130*CLK_HT, data after 280*CLK_HT,
            ( others=>'0' ) after 282*CLK_HT; 
  s_go_crypt <= '0', '1' after 128*CLK_HT, '0' after 130*CLK_HT, 
                     '1' after 280*CLK_HT, '0' after 282*CLK_HT;
  s_go_key <= '0', '1' after 58*CLK_HT, '0' after 60*CLK_HT;
  
  UUT : aes_core port map(
    data_inH => datain,
    input_key => input_key,
    go_cipher => s_go_crypt, 
    go_key => s_go_key, 
    enc_command => s_command, 
    data_outH => dout, 
    data_out_ok => s_d_ok, 
    ready_out => s_ready, 
    error => s_broken,
    rst => rst, 
    ck => ck );
  end a_tb;
