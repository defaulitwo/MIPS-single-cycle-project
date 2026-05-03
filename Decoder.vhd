----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:26:21 11/25/2025 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
    port (
        I       : in    std_logic_vector(4 downto 0);
        O       : out   std_logic_vector(31 downto 0);
        enable  : in    std_logic
    );
end Decoder;

architecture Behavioral of Decoder is

begin

    process(I, enable)
    begin
        if enable = '1' then
            case I is
                when "00000" => O <= "00000000000000000000000000000001";
                when "00001" => O <= "00000000000000000000000000000010";
                when "00010" => O <= "00000000000000000000000000000100";
                when "00011" => O <= "00000000000000000000000000001000";
                when "00100" => O <= "00000000000000000000000000010000";
                when "00101" => O <= "00000000000000000000000000100000";
                when "00110" => O <= "00000000000000000000000001000000";
                when "00111" => O <= "00000000000000000000000010000000";
                when "01000" => O <= "00000000000000000000000100000000";
                when "01001" => O <= "00000000000000000000001000000000";
                when "01010" => O <= "00000000000000000000010000000000";
                when "01011" => O <= "00000000000000000000100000000000";
                when "01100" => O <= "00000000000000000001000000000000";
                when "01101" => O <= "00000000000000000010000000000000";
                when "01110" => O <= "00000000000000000100000000000000";
                when "01111" => O <= "00000000000000001000000000000000";
                when "10000" => O <= "00000000000000010000000000000000";
                when "10001" => O <= "00000000000000100000000000000000";
                when "10010" => O <= "00000000000001000000000000000000";
                when "10011" => O <= "00000000000010000000000000000000";
                when "10100" => O <= "00000000000100000000000000000000";
                when "10101" => O <= "00000000001000000000000000000000";
                when "10110" => O <= "00000000010000000000000000000000";
                when "10111" => O <= "00000000100000000000000000000000";
                when "11000" => O <= "00000001000000000000000000000000";
                when "11001" => O <= "00000010000000000000000000000000";
                when "11010" => O <= "00000100000000000000000000000000";
                when "11011" => O <= "00001000000000000000000000000000";
                when "11100" => O <= "00010000000000000000000000000000";
                when "11101" => O <= "00100000000000000000000000000000";
                when "11110" => O <= "01000000000000000000000000000000";
                when "11111" => O <= "10000000000000000000000000000000";
                when others => O <= (others => '0');
            end case;
        else
            O <= (others => '0');
        end if;
    end process;

end Behavioral;

