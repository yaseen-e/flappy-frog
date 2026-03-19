library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity goal_zone is
    Port (
        pixel_x       : in  integer;
        pixel_y       : in  integer;
        scene_x       : in  integer;
        goal_pixel_on : out STD_LOGIC;
        goal_world_x  : out integer;
        goal_y        : out integer;
        goal_width    : out integer;
        goal_height   : out integer
    );
end goal_zone;

architecture Behavioral of goal_zone is
    constant GOAL_WORLD_X_C : integer := 2460;
    constant GOAL_Y_C       : integer := 390;
    constant GOAL_WIDTH_C   : integer := 70;
    constant GOAL_HEIGHT_C  : integer := 170;

    signal goal_screen_x : integer;
begin
    goal_screen_x <= GOAL_WORLD_X_C - scene_x;

    goal_pixel_on <= '1' when (pixel_x >= goal_screen_x and pixel_x < goal_screen_x + GOAL_WIDTH_C and
                                pixel_y >= GOAL_Y_C and pixel_y < GOAL_Y_C + GOAL_HEIGHT_C)
                     else '0';

    goal_world_x <= GOAL_WORLD_X_C;
    goal_y <= GOAL_Y_C;
    goal_width <= GOAL_WIDTH_C;
    goal_height <= GOAL_HEIGHT_C;
end Behavioral;
