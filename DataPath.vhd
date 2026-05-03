----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:18:22 11/26/2025 
-- Design Name: 
-- Module Name:    DataPath - Behavioral 
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

entity DataPath is
    port (
        clk, reset  : in     STD_LOGIC; 
        instr       : in     STD_LOGIC_VECTOR(31 downto 0); 
        readdata    : in     std_logic_vector(31 downto 0);
        aluoperation: in     STD_LOGIC_VECTOR(3 downto 0); 
        zero        : out    STD_LOGIC; 
        
        regwrite    : in     STD_LOGIC;
        aluout      : out    STD_LOGIC_VECTOR(31 downto 0);
        regdst      : in     STD_LOGIC;
        alusrc      : in     STD_LOGIC;
        pcsrc       : in     std_logic;
        jump        : in     std_logic;
        memtoreg    : in     std_logic;
        
        pc          : out    std_logic_vector(31 downto 0);
        writedata   : out    std_logic_vector(31 downto 0)
    );
end DataPath;

architecture Behavioral of DataPath is
    signal rs, rt, rd, shamt        : std_logic_vector(4 downto 0); -- instruction fields
    signal op, funct                : std_logic_vector(5 downto 0);
    signal immediate                : std_logic_vector(15 downto 0);
    signal jAddress                 : std_logic_vector(25 downto 0);

    signal jAddress28               : std_logic_vector(27 downto 0); -- intermediate signals
    signal jAddressSL2              : std_logic_vector(27 downto 0);
    signal jAddressConcatenated     : std_logic_vector(31 downto 0);
    signal signExtendedImmediate    : std_logic_vector(31 downto 0);
    
    signal data1, data2             : std_logic_vector(31 downto 0); -- register read data 1,2

    signal aluOperand1, aluOperand2 : std_logic_vector(31 downto 0); -- alu input data
    signal aluResult                : std_logic_vector(31 downto 0); -- alu result

    signal writeRegAddress          : std_logic_vector(4 downto 0); -- write register address
    signal writeRegData             : std_logic_vector(31 downto 0);

    signal currentPC, nextPC        : std_logic_vector(31 downto 0); -- pc output and input
    signal PCPlusFour               : std_logic_vector(31 downto 0); -- PC + 4
    signal immediateSL2             : std_logic_vector(31 downto 0); -- immediate shifted left by 2
    signal branchAdderResult        : std_logic_vector(31 downto 0);
    signal PCFirstStage             : std_logic_vector(31 downto 0); -- first stage of MUX (for branch)
    signal PCSecondStage            : std_logic_vector(31 downto 0); -- second stage of MUX (for jump)

begin
    
    op <= instr(31 downto 26);
    rs <= instr(25 downto 21);
    rt <= instr(20 downto 16);
    rd <= instr(15 downto 11);
    shamt <= instr(10 downto 6);
    funct <= instr(5 downto 0);
    immediate <= instr(15 downto 0);
    jAddress <= instr(25 downto 0);

    signExt : SignExtender port map (
        I => immediate,
        O => signExtendedImmediate
    );

    writeRegMux : Mux2 generic map (
        n => 5
    )
    port map (
        I0 => rt,
        I1 => rd,
        S => regdst,
        Y => writeRegAddress
    );

    aluOperandMux : Mux2 port map (
        I0 => data2,
        I1 => signExtendedImmediate,
        S => alusrc,
        Y => aluOperand2
    );

    regfile0 : RegisterFile port map (
        read_sel1 => rs,
        read_sel2 => rt,
        write_sel => writeRegAddress,
        write_ena => regwrite,
        write_data => writeRegData,
        data1 => aluOperand1,
        data2 => data2,
        clk => clk,
        reset => reset
    );

    writedata <= data2;

    alu0 : ALU port map (
        data1 => aluOperand1,
        data2 => aluOperand2,
        aluop => aluoperation,
        dataout => aluResult,
        zflag => zero
    );

    aluout <= aluResult;

    writeDataMux : Mux2 port map (
        I0 => aluResult,
        I1 => readdata,
        Y => writeRegData,
        S => memtoreg
    );

    PCAdder : Adder port map (
        A => currentPC,
        B => X"00000004",
        S => PCPlusFour,
        cin => '0'
    );

    branchAdder : Adder port map (
        A => PCPlusFour,
        B => immediateSL2,
        S => branchAdderResult,
        cin => '0'
    );

    sl0 : Sl2 port map (
        I => signExtendedImmediate,
        O => immediateSL2
    );

    branchMux : Mux2 port map (
        I0 => PCPlusFour,
        I1 => branchAdderResult,
        S => pcsrc,
        Y => PCFirstStage
    );

    jAddress28 <= "00" & jAddress;

    sl1 : Sl2 generic map (
        n => 28
    ) 
    port map (
        I => jAddress28,
        O => jAddressSL2
    );

    jAddressConcatenated <= PCPlusFour(31 downto 28) & jAddressSL2;

    jumpMux : Mux2 port map (
        I0 => PCFirstStage,
        I1 => jAddressConcatenated,
        S => jump,
        Y => PCSecondStage
    );

    programCounter : Flopr port map (
        D => PCSecondStage,
        Q => currentPC,
        reset => reset,
        clk => clk,
        enable => '1'
    );

    pc <= currentPC;

end Behavioral;

