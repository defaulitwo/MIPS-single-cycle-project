library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--use ieee.math_real.all;
use ieee.std_logic_unsigned.ALL ;

entity ALU is
    port (
        data1   : in    std_logic_vector(31 downto 0);
        data2   : in    std_logic_vector(31 downto 0);
        aluop   : in    std_logic_vector(3  downto 0);
        dataout : out   std_logic_vector(31 downto 0);
        zflag   : out   std_logic
    );
end entity;

architecture behavior of ALU is
    signal AA, BB, result   : std_logic_vector(31 downto 0);
    signal adderResult      : std_logic_vector(32 downto 0);
    signal less, overflow   : std_logic;
begin

    AA <= not(data1) when aluop(3) = '1' -- first operand after choosing A or A'
          else data1;

    BB <= not(data2) when aluop(2) = '1' -- second operand after choosing B or B'
          else data2;
 
    adderResult <= ('0' & AA) + ('0' & BB) + aluop(2); -- adder result

    overflow <= (AA(31) xnor BB(31)) and (adderResult(31) xor AA(31)); -- overflow

    less <= adderResult(31) xor overflow; -- less signal

    result <= AA and BB                                 when aluop(1 downto 0) = "00" else
              AA or  BB                                 when aluop(1 downto 0) = "01" else
              adderResult(31 downto 0)                  when aluop(1 downto 0) = "10" else
              "0000000000000000000000000000000" & less  when aluop(1 downto 0) = "11" 
              else X"00000000";
    
    dataout <= result;

    zflag <= '1' when result(31 downto 0) = X"00000000" else '0';

end architecture;