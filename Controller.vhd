----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:19 12/16/2025 
-- Design Name: 
-- Module Name:    Controller - Behavioral 
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
use work.package1.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Controller is
    port(
        op, funct           : in    std_logic_vector(5 downto 0);
        zero                : in    std_logic;
        memtoreg, memwrite  : out   std_logic;
        pcsrc, alusrc       : out   std_logic;
        regdst, regwrite    : out   std_logic;
        jump                : out   std_logic;
        alucontrol          : out   std_logic_vector(3 downto 0)
    );
end Controller;

architecture Behavioral of Controller is
    signal aluop    : std_logic_vector(1 downto 0);
    signal branch   : std_logic;
begin

    maindec : MainDecoder port map (
        op => op,
        funct => funct,
        memtoreg => memtoreg,
        memwrite => memwrite,
        branch => branch,
        alusrc => alusrc,
        regdst => regdst,
        regwrite => regwrite,
        jump => jump,
        aluop => aluop
    );

    aludec : ALUDecoder port map (
        funct => funct,
        aluop => aluop,
        alucontrol => alucontrol
    );

    pcsrc <= branch and zero;

end Behavioral;

