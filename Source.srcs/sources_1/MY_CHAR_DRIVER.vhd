----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: MY_CHAR_DRIVER - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;       -- For unsigned()
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MY_CHAR_DRIVER is
PORT( hcount,vcount : in STD_LOGIC_VECTOR(10 downto 0);
      ASCII_CHAR : out STD_LOGIC_VECTOR(6 downto 0));
end MY_CHAR_DRIVER;

architecture Behavioral of MY_CHAR_DRIVER is
    signal h_int : integer;
    signal v_int : integer;
begin
    h_int <= conv_integer(hcount);
    v_int <= conv_integer(vcount);

    process(h_int, v_int)
        variable char_index : integer range 0 to 15;
    begin
        -- 11 chars x 24 px = 264 px wide, 24 px high.
        -- Active video starts at h=260, v=25; use equal 24 px padding from top-left.
        -- Bounding box: x=[284,548), y=[49,73)
        if (h_int >= 284 and h_int < 548) and (v_int >= 49 and v_int < 73) then
            char_index := (h_int - 284) / 24; -- 24 pixels per character (8x3)
            case char_index is
                when 0 => ASCII_CHAR <= "0000001"; -- 'F' (Index 1)
                when 1 => ASCII_CHAR <= "0000010"; -- 'L' (Index 2)
                when 2 => ASCII_CHAR <= "0000011"; -- 'A' (Index 3)
                when 3 => ASCII_CHAR <= "0000100"; -- 'P' (Index 4)
                when 4 => ASCII_CHAR <= "0000100"; -- 'P' (Index 4)
                when 5 => ASCII_CHAR <= "0000101"; -- 'Y' (Index 5)
                when 6 => ASCII_CHAR <= "0000000"; -- ' ' (Space, Index 0)
                when 7 => ASCII_CHAR <= "0000001"; -- 'F' (Index 1)
                when 8 => ASCII_CHAR <= "0000110"; -- 'R' (Index 6)
                when 9 => ASCII_CHAR <= "0000111"; -- 'O' (Index 7)
                when 10 => ASCII_CHAR <= "0001000"; -- 'G' (Index 8)
                when others => ASCII_CHAR <= "0000000"; -- Space
            end case;
        else
            ASCII_CHAR <= "0100000"; -- Output Space (blank) everywhere else
        end if;
    end process;
end Behavioral;
