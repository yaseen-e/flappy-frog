library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity platform_manager is
    Port (
        scene_x      : in  integer;
        p1_x_screen  : out integer;
        p2_x_screen  : out integer;
        p3_x_screen  : out integer;
        p4_x_screen  : out integer;
        p5_x_screen  : out integer;
        p1_world_x   : out integer;
        p2_world_x   : out integer;
        p3_world_x   : out integer;
        p4_world_x   : out integer;
        p5_world_x   : out integer;
        p1_unit      : out integer range 1 to 4;
        p2_unit      : out integer range 1 to 4;
        p3_unit      : out integer range 1 to 4;
        p4_unit      : out integer range 1 to 4;
        p5_unit      : out integer range 1 to 4
    );
end platform_manager;

architecture Behavioral of platform_manager is
    -- Fixed world-space anchor positions for each platform.
    constant P1_WORLD_X_C : integer := 220;
    constant P2_WORLD_X_C : integer := 520;
    constant P3_WORLD_X_C : integer := 880;
    constant P4_WORLD_X_C : integer := 1240;
    constant P5_WORLD_X_C : integer := 1631;
begin
    -- Export world coordinates for collision logic.
    p1_world_x <= P1_WORLD_X_C;
    p2_world_x <= P2_WORLD_X_C;
    p3_world_x <= P3_WORLD_X_C;
    p4_world_x <= P4_WORLD_X_C;
    p5_world_x <= P5_WORLD_X_C;

    -- Platform lengths in 24 px units.
    p1_unit <= 4;
    p2_unit <= 2;
    p3_unit <= 3;
    p4_unit <= 1;
    p5_unit <= 4;

    -- Convert world X to screen X using camera scroll.
    p1_x_screen <= P1_WORLD_X_C - scene_x;
    p2_x_screen <= P2_WORLD_X_C - scene_x;
    p3_x_screen <= P3_WORLD_X_C - scene_x;
    p4_x_screen <= P4_WORLD_X_C - scene_x;
    p5_x_screen <= P5_WORLD_X_C - scene_x;
end Behavioral;
