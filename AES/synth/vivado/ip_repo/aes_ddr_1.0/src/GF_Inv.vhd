-- Library Declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- Component Declaration
entity gf_inv is
    port ( a_in : std_logic_vector (3 downto 0);
        d : out std_logic_vector (3 downto 0));
end gf_inv;

-- Architecture of the Component
architecture a_gf_inv of gf_inv is
begin
    process (a_in)
    begin
        case a_in is
            when "0000" => d <= "0000";
            when "0001" => d <= "0001";
            when "0010" => d <= "1001";
            when "0011" => d <= "1110";
            when "0100" => d <= "1101";
            when "0101" => d <= "1011";
            when "0110" => d <= "0111";
            when "0111" => d <= "0110";
            when "1000" => d <= "1111";
            when "1001" => d <= "0010";
            when "1010" => d <= "1100";
            when "1011" => d <= "0101";
            when "1100" => d <= "1010";
            when "1101" => d <= "0100";
            when "1110" => d <= "0011";
            when "1111" => d <= "1000";
            when others => null;
            end case;
        end process;
    end a_gf_inv;



