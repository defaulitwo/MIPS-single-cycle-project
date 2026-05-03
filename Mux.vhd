----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:43:08 11/25/2025 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
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

entity Mux is
    port (
        I       : in    std_logic_vector(32*32 - 1 downto 0);
        O       : out   std_logic_vector(31 downto 0);
        sel     : in    std_logic_vector(4 downto 0)
    );
end Mux;

architecture Behavioral of Mux is
begin
    
    O <= I((0  + 1)*32 - 1 downto (0 )*32) when sel = "00000" else
         I((1  + 1)*32 - 1 downto (1 )*32) when sel = "00001" else
         I((2  + 1)*32 - 1 downto (2 )*32) when sel = "00010" else
         I((3  + 1)*32 - 1 downto (3 )*32) when sel = "00011" else
         I((4  + 1)*32 - 1 downto (4 )*32) when sel = "00100" else
         I((5  + 1)*32 - 1 downto (5 )*32) when sel = "00101" else
         I((6  + 1)*32 - 1 downto (6 )*32) when sel = "00110" else
         I((7  + 1)*32 - 1 downto (7 )*32) when sel = "00111" else
         I((8  + 1)*32 - 1 downto (8 )*32) when sel = "01000" else
         I((9  + 1)*32 - 1 downto (9 )*32) when sel = "01001" else
         I((10 + 1)*32 - 1 downto (10)*32) when sel = "01010" else
         I((11 + 1)*32 - 1 downto (11)*32) when sel = "01011" else
         I((12 + 1)*32 - 1 downto (12)*32) when sel = "01100" else
         I((13 + 1)*32 - 1 downto (13)*32) when sel = "01101" else
         I((14 + 1)*32 - 1 downto (14)*32) when sel = "01110" else
         I((15 + 1)*32 - 1 downto (15)*32) when sel = "01111" else
         I((16 + 1)*32 - 1 downto (16)*32) when sel = "10000" else
         I((17 + 1)*32 - 1 downto (17)*32) when sel = "10001" else
         I((18 + 1)*32 - 1 downto (18)*32) when sel = "10010" else
         I((19 + 1)*32 - 1 downto (19)*32) when sel = "10011" else
         I((20 + 1)*32 - 1 downto (20)*32) when sel = "10100" else
         I((21 + 1)*32 - 1 downto (21)*32) when sel = "10101" else
         I((22 + 1)*32 - 1 downto (22)*32) when sel = "10110" else
         I((23 + 1)*32 - 1 downto (23)*32) when sel = "10111" else
         I((24 + 1)*32 - 1 downto (24)*32) when sel = "11000" else
         I((25 + 1)*32 - 1 downto (25)*32) when sel = "11001" else
         I((26 + 1)*32 - 1 downto (26)*32) when sel = "11010" else
         I((27 + 1)*32 - 1 downto (27)*32) when sel = "11011" else
         I((28 + 1)*32 - 1 downto (28)*32) when sel = "11100" else
         I((29 + 1)*32 - 1 downto (29)*32) when sel = "11101" else
         I((30 + 1)*32 - 1 downto (30)*32) when sel = "11110" else
         I((31 + 1)*32 - 1 downto (31)*32) when sel = "11111" else
         (others => '0');

end Behavioral;

