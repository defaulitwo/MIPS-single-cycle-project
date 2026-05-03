----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:14 12/16/2025 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL ;

entity Adder is
    port ( 
        A   : IN    STD_LOGIC_VECTOR(31 DOWNTO 0);
        B   : IN    STD_LOGIC_VECTOR(31 DOWNTO 0);
        S   : OUT   STD_LOGIC_VECTOR(31 DOWNTO 0);
        C   : out   STD_LOGIC;
        cin : IN    STD_LOGIC
        );
end Adder;

architecture Behavioral of Adder is
    SIGNAL  temp : STD_LOGIC_VECTOR(32 DOWNTO 0);
begin

    temp <= ('0' & A) + ('0' & B)+ cin;
    S <= temp(31 downto 0);
    C <= temp(32);

end Behavioral;

