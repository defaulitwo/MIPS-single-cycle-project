--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:06:17 12/22/2025
-- Design Name:   
-- Module Name:   /mnt/e/.docs/CO/VHDL/MajorTaskPhase1/MainDecoder_TB.vhd
-- Project Name:  MajorTaskPhase1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MainDecoder
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
 
ENTITY MainDecoder_TB IS
END MainDecoder_TB;
 
ARCHITECTURE behavior OF MainDecoder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MainDecoder
    PORT(
         op : IN  std_logic_vector(5 downto 0);
         memtoreg : OUT  std_logic;
         memwrite : OUT  std_logic;
         branch : OUT  std_logic;
         alusrc : OUT  std_logic;
         regdst : OUT  std_logic;
         regwrite : OUT  std_logic;
         jump : OUT  std_logic;
         aluop : OUT  std_logic_vector(1 downto 0);
         memread : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal memtoreg : std_logic;
   signal memwrite : std_logic;
   signal branch : std_logic;
   signal alusrc : std_logic;
   signal regdst : std_logic;
   signal regwrite : std_logic;
   signal jump : std_logic;
   signal aluop : std_logic_vector(1 downto 0);
   signal memread : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MainDecoder PORT MAP (
          op => op,
          memtoreg => memtoreg,
          memwrite => memwrite,
          branch => branch,
          alusrc => alusrc,
          regdst => regdst,
          regwrite => regwrite,
          jump => jump,
          aluop => aluop,
          memread => memread
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
