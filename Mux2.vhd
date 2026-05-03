----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:00 12/16/2025 
-- Design Name: 
-- Module Name:    Mux2 - Behavioral 
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

entity Mux2 is
    generic (n  : integer := 32);
    port (
        I0, I1  : in    std_logic_vector(n-1 downto 0);
        S       : in    std_logic;
        Y       : out   std_logic_vector(n-1 downto 0)
    );
end Mux2;

architecture Behavioral of Mux2 is

begin

    Y <= I0 when S = '0' else
         I1 when S = '1';

end Behavioral;

