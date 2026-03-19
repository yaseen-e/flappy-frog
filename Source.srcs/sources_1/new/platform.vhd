library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity platform is
    Port (
        pixel_x    : in  integer;
        pixel_y    : in  integer;
        platform_x : in  integer;
        unit_size  : in  integer range 1 to 4;
        pixel_on   : out STD_LOGIC
    );
end platform;

architecture Behavioral of platform is
    -- Shared platform geometry constants (active-video coordinates)
    constant PLATFORM_Y          : integer := 500;
    constant PLATFORM_HEIGHT_PX  : integer := 18;
    constant PLATFORM_UNIT_WIDTH : integer := 24;
begin
    process(pixel_x, pixel_y, platform_x, unit_size)
        variable platform_width_px : integer;
    begin
        platform_width_px := unit_size * PLATFORM_UNIT_WIDTH;

        if (pixel_x >= platform_x and pixel_x < platform_x + platform_width_px and
            pixel_y >= PLATFORM_Y and pixel_y < PLATFORM_Y + PLATFORM_HEIGHT_PX) then
            pixel_on <= '1';
        else
            pixel_on <= '0';
        end if;
    end process;
end Behavioral;
