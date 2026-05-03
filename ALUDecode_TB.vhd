--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:08:37 12/22/2025
-- Design Name:   
-- Module Name:   /mnt/e/.docs/CO/VHDL/MajorTaskPhase1/ALUDecode_TB.vhd
-- Project Name:  MajorTaskPhase1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALUDecoder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALUDecode_TB IS
END ALUDecode_TB;
 
ARCHITECTURE behavior OF ALUDecode_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALUDecoder
    PORT(
         funct : IN  std_logic_vector(5 downto 0);
         aluop : IN  std_logic_vector(1 downto 0);
         alucontrol : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal funct : std_logic_vector(5 downto 0) := (others => '0');
   signal aluop : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal alucontrol : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALUDecoder PORT MAP (
          funct => funct,
          aluop => aluop,
          alucontrol => alucontrol
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      
      -- insert stimulus here 

      wait;
   end process;

END;
