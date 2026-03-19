----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2026 10:17:57 AM
-- Design Name: 
-- Module Name: frog_motion - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity frog_motion is
	Port (
		clk        : in  STD_LOGIC;
		rst        : in  STD_LOGIC;
		move_left  : in  STD_LOGIC;
		move_right : in  STD_LOGIC;
		frog_x     : out unsigned(10 downto 0)
	);
end frog_motion;

architecture Behavioral of frog_motion is
	constant SCREEN_WIDTH : integer := 1280;
	constant FROG_WIDTH   : integer := 90;
	constant MIN_X        : integer := 0;
	constant MAX_X        : integer := SCREEN_WIDTH - FROG_WIDTH;
	constant START_X      : integer := 100;
	constant STEP_PX      : integer := 5;

	-- 74.25 MHz / 1,237,500 ~= 60 Hz update rate
	constant MOVE_TICK_MAX : integer := 1237500;

	signal move_tick_counter : integer range 0 to MOVE_TICK_MAX - 1 := 0;
	signal frog_x_reg        : unsigned(10 downto 0) := to_unsigned(START_X, 11);
begin

	process(clk)
		variable x_next : integer;
	begin
		if rising_edge(clk) then
			if rst = '1' then
				move_tick_counter <= 0;
				frog_x_reg <= to_unsigned(START_X, 11);
			else
				if move_tick_counter = MOVE_TICK_MAX - 1 then
					move_tick_counter <= 0;
					x_next := to_integer(frog_x_reg);

					if move_left = '1' and move_right = '0' then
						x_next := x_next - STEP_PX;
					elsif move_right = '1' and move_left = '0' then
						x_next := x_next + STEP_PX;
					end if;

					if x_next < MIN_X then
						x_next := MIN_X;
					elsif x_next > MAX_X then
						x_next := MAX_X;
					end if;

					frog_x_reg <= to_unsigned(x_next, frog_x_reg'length);
				else
					move_tick_counter <= move_tick_counter + 1;
				end if;
			end if;
		end if;
	end process;

	frog_x <= frog_x_reg;

end Behavioral;
