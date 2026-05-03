--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:52:29 12/22/2025
-- Design Name:   
-- Module Name:   /mnt/e/.docs/CO/VHDL/MajorTaskPhase1/Datapath_TB.vhd
-- Project Name:  MajorTaskPhase1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataPath
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
 
ENTITY Datapath_TB IS
END Datapath_TB;
 
ARCHITECTURE behavior OF Datapath_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataPath
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         instr : IN  std_logic_vector(31 downto 0);
         readdata : IN  std_logic_vector(31 downto 0);
         aluoperation : IN  std_logic_vector(3 downto 0);
         zero : OUT  std_logic;
         regwrite : IN  std_logic;
         aluout : OUT  std_logic_vector(31 downto 0);
         regdst : IN  std_logic;
         alusrc : IN  std_logic;
         pcsrc : IN  std_logic;
         jump : IN  std_logic;
         memtoreg : IN  std_logic;
         pc : OUT  std_logic_vector(31 downto 0);
         writedata : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal instr : std_logic_vector(31 downto 0) := (others => '0');
   signal readdata : std_logic_vector(31 downto 0) := (others => '0');
   signal aluoperation : std_logic_vector(3 downto 0) := (others => '0');
   signal regwrite : std_logic := '0';
   signal regdst : std_logic := '0';
   signal alusrc : std_logic := '0';
   signal pcsrc : std_logic := '0';
   signal jump : std_logic := '0';
   signal memtoreg : std_logic := '0';

 	--Outputs
   signal zero : std_logic;
   signal aluout : std_logic_vector(31 downto 0);
   signal pc : std_logic_vector(31 downto 0);
   signal writedata : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataPath PORT MAP (
          clk => clk,
          reset => reset,
          instr => instr,
          readdata => readdata,
          aluoperation => aluoperation,
          zero => zero,
          regwrite => regwrite,
          aluout => aluout,
          regdst => regdst,
          alusrc => alusrc,
          pcsrc => pcsrc,
          jump => jump,
          memtoreg => memtoreg,
          pc => pc,
          writedata => writedata
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period/4;	
      instr <= X"00000000";
      wait for clk_period;
      instr <= X"00000001";

      -- insert stimulus here 

      wait;
   end process;

END;
