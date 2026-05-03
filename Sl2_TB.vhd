--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:53:01 12/22/2025
-- Design Name:   
-- Module Name:   /mnt/e/.docs/CO/VHDL/MajorTaskPhase1/Sl2_TB.vhd
-- Project Name:  MajorTaskPhase1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sl2
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
 
ENTITY Sl2_TB IS
END Sl2_TB;
 
ARCHITECTURE behavior OF Sl2_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sl2
    PORT(
         I : IN  std_logic_vector(31 downto 0);
         O : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sl2 PORT MAP (
          I => I,
          O => O
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
      wait for 10 ns;	
      I <= X"00000004";

      wait for 10 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
