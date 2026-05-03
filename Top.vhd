----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:18 12/16/2025 
-- Design Name: 
-- Module Name:    Top - Behavioral 
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

entity Top is
    port(
        clk, reset          : in    std_logic;
        writedata, dataadr  : out   std_logic_vector(31 downto 0);
        memwrite            : out   std_logic;
        pcout               : out   std_logic_vector(31 downto 0)
    );
end Top;

architecture Behavioral of Top is
    signal memwritet    : std_logic;
    signal pc, instr, readdata, datadrt, writedatat  : std_logic_vector(31 downto 0);
begin
    mips0 : MIPS port map (
        memwrite => memwritet,
        pc => pc,
        instr => instr,
        readdata => readdata,
        aluout => datadrt,
        writedata => writedatat,
    
        clk => clk,
        reset => reset
    );

    instrmem : imem port map (
        a => pc(7 downto 2),
        rd => instr
    );

    datamem : dmem port map (
        we => memwritet,
        a => datadrt,
        wd => writedatat,
        rd => readdata,
    
        clk => clk
    );

    memwrite <= memwritet;
    dataadr <= datadrt;
    writedata <= writedatat;

    pcout <= pc;

end Behavioral;

