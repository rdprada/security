
library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.std_logic_misc.all;
    use IEEE.std_logic_arith.all;

library WORK;
package globals is
    -- CONFIGURATION CONSTANTS
    constant C_INCLUDE_DECODING_LOGIC : boolean := true; -- Allow both enc and decryption
    constant C_CTRL_SIGNAL_SIZE       : integer := 1; -- 1 or 2
    constant C_ERR_SIGNAL_SIZE        : integer := 1; -- 1 or 2
    constant RESET_ACTIVE             : std_logic := '0';
    --constant C_INCLUDE_PARITY         : integer := 0; -- 0 false or 1 true

    --constant C_CODE_SIZE              : integer := C_INCLUDE_PARITY;
    constant C_BROKEN : std_logic_vector( C_ERR_SIGNAL_SIZE-1 downto 0 ) := "1";

    subtype T_ENABLE is std_logic_vector( C_CTRL_SIGNAL_SIZE-1 downto 0 );
      constant C_ENABLE  : T_ENABLE := "1"; -- "01"; -- 
      constant C_DISABLE : T_ENABLE := "0"; -- "10"; -- 
    subtype T_ENCDEC is std_logic_vector( C_CTRL_SIGNAL_SIZE-1 downto 0 );
      constant C_DEC : T_ENCDEC := "1"; -- "01"; -- 
      constant C_ENC : T_ENCDEC := "0"; -- "10"; --
    subtype T_READY is std_logic_vector( C_CTRL_SIGNAL_SIZE-1 downto 0 );
      constant C_READY : T_READY := "1"; -- "01"; -- 
      constant C_BUSY  : T_READY := "0"; -- "10"; --

    end globals;
