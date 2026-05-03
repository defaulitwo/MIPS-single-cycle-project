----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:46:01 12/13/2025 
-- Design Name: 
-- Module Name:    ControlAlu - Behavioral 
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

entity ALUDecoder is
port(
    funct     : in  STD_LOGIC_VECTOR(5 downto 0);   
    aluop     : in  STD_LOGIC_VECTOR(1 downto 0);
	  alucontrol: out STD_LOGIC_VECTOR(3 downto 0));
end ALUDecoder;
    
architecture Behavioral of ALUDecoder is

begin
process(aluop, funct)
  begin
    case aluop is
      when "00" => alucontrol <= "0010";  
      when "01" => alucontrol <= "0110";  
      when others =>
        case funct is  
          when "100000" => alucontrol <= "0010";    -- add
          when "100010" => alucontrol <= "0110";    -- sub  
          when "100100" => alucontrol <= "0000";    -- and
          when "100101" => alucontrol <= "0001"; 	  -- or
          when "100111" => alucontrol <= "1100";    -- nor
          when "101010" => alucontrol <= "0111";    -- slt
          when others   => alucontrol <= "0000";  
        end case;
    end case;
  end process;


end Behavioral;

