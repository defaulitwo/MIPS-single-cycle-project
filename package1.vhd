--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package package1 is

    component Flopr
        port (
            D                   : in    std_logic_vector(31 downto 0);
            Q                   : out   std_logic_vector(31 downto 0);
            reset, clk, enable  : in    std_logic
        );
    end component;

    component Decoder
        port (
            I       : in    std_logic_vector(4 downto 0);
            O       : out   std_logic_vector(31 downto 0);
            enable  : in    std_logic
        );
    end component;

    component Mux
        port (
            I       : in    std_logic_vector(32*32 - 1 downto 0);
            O       : out   std_logic_vector(31 downto 0);
            sel     : in    std_logic_vector(4 downto 0)
        );
    end component;

    component RegisterFile
        port (
            read_sel1, read_sel2, write_sel : in    std_logic_vector(4  downto 0);
            write_ena, clk                  : in    std_logic;
            write_data                      : in    std_logic_vector(31 downto 0);
            data1, data2                    : out   std_logic_vector(31 downto 0);
            reset                           : in    std_logic
        );
    end component;

    component ALU
        port (
            data1   : in    std_logic_vector(31 downto 0);
            data2   : in    std_logic_vector(31 downto 0);
            aluop   : in    std_logic_vector(3  downto 0);
            dataout : out   std_logic_vector(31 downto 0);
            zflag   : out   std_logic
        );
    end component;

    component DataPath
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
    end component;

    component MainDecoder
        port (
            op                  : in    STD_LOGIC_VECTOR(5 downto 0);
            funct               : in    std_logic_vector(5 downto 0);
            memtoreg, memwrite  : out   STD_LOGIC;
            branch, alusrc      : out   STD_LOGIC;
            regdst, regwrite    : out   STD_LOGIC;
            jump                : out   STD_LOGIC;
            aluop               : out   STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component ALUDecoder
        port (
            funct       : in    STD_LOGIC_VECTOR(5 downto 0);
            aluop       : in    STD_LOGIC_VECTOR(1 downto 0);
            alucontrol  : out   STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component Controller
        port(
            op, funct           : in    std_logic_vector(5 downto 0);
            zero                : in    std_logic;
            memtoreg, memwrite  : out   std_logic;
            pcsrc, alusrc       : out   std_logic;
            regdst, regwrite    : out   std_logic;
            jump                : out   std_logic;
            alucontrol          : out   std_logic_vector(3 downto 0)
        );
    end component;

    component Mux2
        generic (n  : integer := 32);
        port (
            I0, I1  : in    std_logic_vector(n-1 downto 0);
            S       : in    std_logic;
            Y       : out   std_logic_vector(n-1 downto 0)
        );
    end component;

    component Sl2
        generic
        (
            n : integer := 32 
        );
        port (
            I : in      std_logic_vector(n-1 downto 0);
            O : out     std_logic_vector(n-1 downto 0)
        );
    end component;

    component Adder
        port ( 
            A   : IN    STD_LOGIC_VECTOR(31 DOWNTO 0);
            B   : IN    STD_LOGIC_VECTOR(31 DOWNTO 0);
            S   : OUT   STD_LOGIC_VECTOR(31 DOWNTO 0);
            C   : OUT   STD_LOGIC;
            cin : IN    STD_LOGIC
        );
    end component;

    component SignExtender
        PORT (	
            I : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            O : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
        );
    end component;

    component MIPS
        port (
            clk, reset          : in    std_logic;
            pc                  : out   std_logic_vector(31 downto 0);
            instr               : in    std_logic_vector(31 downto 0);
            memwrite            : out   std_logic;
            aluout, writedata   : out   std_logic_vector(31 downto 0);
            readdata            : in    std_logic_vector(31 downto 0)
        );
    end component;

    component imem
        port (
            a: in STD_LOGIC_VECTOR(5 downto 0);
            rd: out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    component dmem
        port (
            clk, we: in STD_LOGIC;
            a, wd: in STD_LOGIC_VECTOR (31 downto 0);
            rd: out STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;

    component Top
        port (
            clk, reset          : in    std_logic;
            writedata, dataadr  : out   std_logic_vector(31 downto 0);
            memwrite            : out   std_logic
        );
    end component;
    
end package1;

package body package1 is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end package1;
