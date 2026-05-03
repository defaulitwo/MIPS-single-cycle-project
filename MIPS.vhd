----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:31:21 12/16/2025 
-- Design Name: 
-- Module Name:    MIPS - Behavioral 
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

entity MIPS is
    port (
        clk, reset          : in    std_logic;
        pc                  : out   std_logic_vector(31 downto 0);
        instr               : in    std_logic_vector(31 downto 0);
        memwrite            : out   std_logic;
        aluout, writedata   : out   std_logic_vector(31 downto 0);
        readdata            : in    std_logic_vector(31 downto 0)
    );
end MIPS;

architecture Behavioral of MIPS is
    signal memtoreg, alusrc, regdst, regwrite, jump, pcsrc  : std_logic;
    signal zero : std_logic;
    signal alucontrol   : std_logic_vector(3 downto 0); 
    signal op, funct    : std_logic_vector(5 downto 0);
begin
    
    op <= instr(31 downto 26);
    funct <= instr(5 downto 0);

    datapath0 : DataPath port map (
        memtoreg => memtoreg,
        alusrc => alusrc,
        regdst => regdst,
        regwrite => regwrite,
        jump => jump,
        pcsrc => pcsrc,
        zero => zero,
        aluoperation => alucontrol,
        clk => clk,
        reset => reset,
        instr => instr,
        readdata => readdata,
        pc => pc,
        aluout => aluout,
        writedata => writedata
    );

    controller0 : Controller port map (
        memtoreg => memtoreg,
        alusrc => alusrc,
        regdst => regdst,
        regwrite => regwrite,
        jump => jump,
        pcsrc => pcsrc,
        zero => zero,
        alucontrol => alucontrol,
        memwrite => memwrite,
        op => op,
        funct => funct
    );

end Behavioral;

