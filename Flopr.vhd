----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:32:43 11/25/2025 
-- Design Name: 
-- Module Name:    Flopr - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Flopr is
    port (
        D                   : in    std_logic_vector(31 downto 0);
        Q                   : out   std_logic_vector(31 downto 0);
        reset, clk, enable  : in    std_logic
    );
end Flopr;

architecture Behavioral of Flopr is
    signal temp : std_logic_vector(31 downto 0) := (others => '0');
begin

    process(clk, reset) -- register is sensitive to clock and reset signals
    begin
        if reset = '1' then -- async reset
            temp <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                temp <= D;
            end if;
        end if;
    end process;

    Q <= temp;
    
end Behavioral;

