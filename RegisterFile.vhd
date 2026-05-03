----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:45:33 11/25/2025 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
    port (
        read_sel1, read_sel2, write_sel : in    std_logic_vector(4  downto 0);
        write_ena, clk                  : in    std_logic;
        write_data                      : in    std_logic_vector(31 downto 0);
        data1, data2                    : out   std_logic_vector(31 downto 0);
        reset                           : in    std_logic
    );
end RegisterFile;

architecture Behavioral of RegisterFile is
    signal globalReset  : std_logic;
    signal allRegData   : std_logic_vector(32*32 - 1 downto 0); 
    signal decoderOutput: std_logic_vector(31 downto 0);
begin

    decd0 : Decoder port map (
        I => write_sel,
        O => decoderOutput,
        enable => write_ena
    );

    mux0 : Mux port map (
        I => allRegData,
        O => data1,
        sel => read_sel1
    );

    mux1 : Mux port map (
        I => allRegData,
        O => data2,
        sel => read_sel2
    );

    -- reg0 : Flopr port map ( -- $zero
    --     D => (others => '0'),
    --     Q => allRegData((0+1)*32 - 1 downto (0)*32),
    --     clk => clk,
    --     reset => '0',
    --     enable => '0'
    -- );

    allRegData((0+1)*32 - 1 downto (0)*32) <= X"00000000";

    reg1 : Flopr port map (
        D => write_data,
        Q => allRegData((1+1)*32 - 1 downto (1)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(1)
    );

    reg2 : Flopr port map (
        D => write_data,
        Q => allRegData((2+1)*32 - 1 downto (2)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(2)
    );

    reg3 : Flopr port map (
        D => write_data,
        Q => allRegData((3+1)*32 - 1 downto (3)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(3)
    );

    reg4 : Flopr port map (
        D => write_data,
        Q => allRegData((4+1)*32 - 1 downto (4)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(4)
    );

    reg5 : Flopr port map (
        D => write_data,
        Q => allRegData((5+1)*32 - 1 downto (5)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(5)
    );

    reg6 : Flopr port map (
        D => write_data,
        Q => allRegData((6+1)*32 - 1 downto (6)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(6)
    );

    reg7 : Flopr port map (
        D => write_data,
        Q => allRegData((7+1)*32 - 1 downto (7)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(7)
    );

    reg8 : Flopr port map (
        D => write_data,
        Q => allRegData((8+1)*32 - 1 downto (8)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(8)
    );

    reg9 : Flopr port map (
        D => write_data,
        Q => allRegData((9+1)*32 - 1 downto (9)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(9)
    );

    reg10 : Flopr port map (
        D => write_data,
        Q => allRegData((10+1)*32 - 1 downto (10)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(10)
    );

    reg11 : Flopr port map (
        D => write_data,
        Q => allRegData((11+1)*32 - 1 downto (11)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(11)
    );

    reg12 : Flopr port map (
        D => write_data,
        Q => allRegData((12+1)*32 - 1 downto (12)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(12)
    );

    reg13 : Flopr port map (
        D => write_data,
        Q => allRegData((13+1)*32 - 1 downto (13)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(13)
    );

    reg14 : Flopr port map (
        D => write_data,
        Q => allRegData((14+1)*32 - 1 downto (14)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(14)
    );

    reg15 : Flopr port map (
        D => write_data,
        Q => allRegData((15+1)*32 - 1 downto (15)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(15)
    );

    reg16 : Flopr port map (
        D => write_data,
        Q => allRegData((16+1)*32 - 1 downto (16)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(16)
    );

    reg17 : Flopr port map (
        D => write_data,
        Q => allRegData((17+1)*32 - 1 downto (17)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(17)
    );

    reg18 : Flopr port map (
        D => write_data,
        Q => allRegData((18+1)*32 - 1 downto (18)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(18)
    );

    reg19 : Flopr port map (
        D => write_data,
        Q => allRegData((19+1)*32 - 1 downto (19)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(19)
    );

    reg20 : Flopr port map (
        D => write_data,
        Q => allRegData((20+1)*32 - 1 downto (20)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(20)
    );

    reg21 : Flopr port map (
        D => write_data,
        Q => allRegData((21+1)*32 - 1 downto (21)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(21)
    );

    reg22 : Flopr port map (
        D => write_data,
        Q => allRegData((22+1)*32 - 1 downto (22)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(22)
    );

    reg23 : Flopr port map (
        D => write_data,
        Q => allRegData((23+1)*32 - 1 downto (23)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(23)
    );

    reg24 : Flopr port map (
        D => write_data,
        Q => allRegData((24+1)*32 - 1 downto (24)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(24)
    );

    reg25 : Flopr port map (
        D => write_data,
        Q => allRegData((25+1)*32 - 1 downto (25)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(25)
    );

    reg26 : Flopr port map (
        D => write_data,
        Q => allRegData((26+1)*32 - 1 downto (26)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(26)
    );

    reg27 : Flopr port map (
        D => write_data,
        Q => allRegData((27+1)*32 - 1 downto (27)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(27)
    );

    reg28 : Flopr port map (
        D => write_data,
        Q => allRegData((28+1)*32 - 1 downto (28)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(28)
    );

    reg29 : Flopr port map (
        D => write_data,
        Q => allRegData((29+1)*32 - 1 downto (29)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(29)
    );

    reg30 : Flopr port map (
        D => write_data,
        Q => allRegData((30+1)*32 - 1 downto (30)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(30)
    );

    reg31 : Flopr port map (
        D => write_data,
        Q => allRegData((31+1)*32 - 1 downto (31)*32),
        clk => clk,
        reset => globalReset,
        enable => decoderOutput(31)
    );

    globalReset <= reset;

end Behavioral;

