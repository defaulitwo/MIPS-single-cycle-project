----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:39 12/16/2025 
-- Design Name: 
-- Module Name:    SignExtender - Behavioral 
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
USE IEEE.STD_LOGIC_1164.ALL;

entity SignExtender is
    PORT (	
        I : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        O : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
    );
end SignExtender;

architecture Behavioral of SignExtender is
begin
    O <= X"ffff" & I WHEN I(15) = '1' ELSE
         X"0000" & I;
end Behavioral;

