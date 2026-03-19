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
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;       -- For unsigned()

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CHAR_GEN is
PORT(clk25, blank : in STD_LOGIC; hcount,vcount : in STD_LOGIC_VECTOR(10 downto 0); 
     ASCII_CHAR : in STD_LOGIC_VECTOR(6 downto 0);
     R3,R2,R1,R0,G3,G2,G1,G0,B3,B2,B1,B0 : out STD_LOGIC);
end CHAR_GEN;

architecture Behavioral of CHAR_GEN is
-- --------------------------------------------------------------------------
signal pixel_row : STD_LOGIC_VECTOR(2 downto 0);
signal pixel_col : STD_LOGIC_VECTOR(2 downto 0);

signal ROM_ADDRESS : STD_LOGIC_VECTOR(9 downto 0);
signal ROM_DATA : STD_LOGIC_VECTOR(7 downto 0);
signal INTENSITY : STD_LOGIC;

-- Match MY_CHAR_DRIVER top-left anchor and 16x16 glyph footprint (2x scale).
constant TEXT_START_X : integer := 284;
constant TEXT_END_X   : integer := 460; -- 11 chars * 16px
constant TEXT_START_Y : integer := 49;
constant TEXT_END_Y   : integer := 65;  -- 16px

COMPONENT rom1kx8
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
-- -----------------------------------------------------------------------------
begin
my_rom : rom1kx8 PORT MAP (clka => clk25, addra => ROM_ADDRESS, douta => ROM_DATA);

process(hcount, vcount)
  variable h_i : integer;
  variable v_i : integer;
begin
  h_i := conv_integer(hcount);
  v_i := conv_integer(vcount);

  if (h_i >= TEXT_START_X and h_i < TEXT_END_X and
      v_i >= TEXT_START_Y and v_i < TEXT_END_Y) then
    pixel_row <= conv_std_logic_vector((v_i - TEXT_START_Y) / 2, 3);
    pixel_col <= conv_std_logic_vector((h_i - TEXT_START_X) / 2, 3);
  else
    pixel_row <= (others => '0');
    pixel_col <= (others => '0');
  end if;
end process;

ROM_ADDRESS <= ASCII_CHAR & pixel_row;  -- Generating ROM address

 process(clk25)
  variable col1,col2,col3 : NATURAL range 0 to 7;
  begin
   if rising_edge(clk25) then
      col3 := col2;
      col2 := col1;
      col1 := conv_integer(pixel_col);
      
      -- Read bits from left-to-right (7 down to 0) to un-flip the text
      INTENSITY <= ROM_DATA(col3); 
   end if;
 end process;

 R3 <= INTENSITY when blank='0' else '0';
 R2 <= INTENSITY when blank='0' else '0';
 R1 <= INTENSITY when blank='0' else '0';
 R0 <= INTENSITY when blank='0' else '0';
 
 G3 <= INTENSITY when blank='0' else '0';
 G2 <= INTENSITY when blank='0' else '0';
 G1 <= INTENSITY when blank='0' else '0';
 G0 <= INTENSITY when blank='0' else '0';
 
 B3 <= INTENSITY when blank='0' else '0';
 B2 <= INTENSITY when blank='0' else '0';
 B1 <= INTENSITY when blank='0' else '0';
 B0 <= INTENSITY when blank='0' else '0';

end Behavioral;
