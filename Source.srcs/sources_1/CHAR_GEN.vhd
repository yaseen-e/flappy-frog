----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Design Name:
-- Module Name: CHAR_GEN - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.02 - Timing-friendly text sampling update
-- Additional Comments:
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CHAR_GEN is
PORT(
    clk25, blank : in STD_LOGIC;
    hcount, vcount : in STD_LOGIC_VECTOR(10 downto 0);
    ASCII_CHAR : in STD_LOGIC_VECTOR(6 downto 0);
    R3, R2, R1, R0, G3, G2, G1, G0, B3, B2, B1, B0 : out STD_LOGIC
);
end CHAR_GEN;

architecture Behavioral of CHAR_GEN is
    signal pixel_row : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal pixel_col : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

    signal ROM_ADDRESS : STD_LOGIC_VECTOR(9 downto 0);
    signal ROM_DATA : STD_LOGIC_VECTOR(7 downto 0);
    signal INTENSITY : STD_LOGIC;

    -- Match MY_CHAR_DRIVER top-left anchor and 8x8 glyph footprint.
    constant TEXT_START_X : integer := 284;
    constant TEXT_END_X   : integer := 372; -- 11 chars * 8px
    constant TEXT_START_Y : integer := 49;
    constant TEXT_END_Y   : integer := 57;  -- 8px

    COMPONENT rom1kx8
      PORT (
        clka  : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
    END COMPONENT;
begin
    my_rom : rom1kx8
      PORT MAP (
        clka  => clk25,
        addra => ROM_ADDRESS,
        douta => ROM_DATA
      );

    process(hcount, vcount)
        variable h_i : integer;
        variable v_i : integer;
    begin
        h_i := to_integer(unsigned(hcount));
        v_i := to_integer(unsigned(vcount));

        if (h_i >= TEXT_START_X and h_i < TEXT_END_X and
            v_i >= TEXT_START_Y and v_i < TEXT_END_Y) then
            pixel_row <= std_logic_vector(to_unsigned(v_i - TEXT_START_Y, 3));
            pixel_col <= std_logic_vector(to_unsigned(h_i - TEXT_START_X, 3));
        else
            pixel_row <= (others => '0');
            pixel_col <= (others => '0');
        end if;
    end process;

    ROM_ADDRESS <= ASCII_CHAR & pixel_row;

    process(clk25)
        variable col1, col2, col3 : natural range 0 to 7;
    begin
        if rising_edge(clk25) then
            col3 := col2;
            col2 := col1;
            col1 := to_integer(unsigned(pixel_col));
            INTENSITY <= ROM_DATA(col3);
        end if;
    end process;

    R3 <= INTENSITY when blank = '0' else '0';
    R2 <= INTENSITY when blank = '0' else '0';
    R1 <= INTENSITY when blank = '0' else '0';
    R0 <= INTENSITY when blank = '0' else '0';

    G3 <= INTENSITY when blank = '0' else '0';
    G2 <= INTENSITY when blank = '0' else '0';
    G1 <= INTENSITY when blank = '0' else '0';
    G0 <= INTENSITY when blank = '0' else '0';

    B3 <= INTENSITY when blank = '0' else '0';
    B2 <= INTENSITY when blank = '0' else '0';
    B1 <= INTENSITY when blank = '0' else '0';
    B0 <= INTENSITY when blank = '0' else '0';

end Behavioral;
