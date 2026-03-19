library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity platform is
    Port (
        clk        : in  STD_LOGIC;
        rst        : in  STD_LOGIC;
        disappear_pulse : in  STD_LOGIC;
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

    type platform_state_t is (SHOWN, HIDDEN);
    signal current_state : platform_state_t := SHOWN;
    signal next_state    : platform_state_t := SHOWN;
    signal state_visible : STD_LOGIC := '1';
    signal platform_width_px : integer;
begin
    platform_width_px <= unit_size * PLATFORM_UNIT_WIDTH;

    -- C0: State register process
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                current_state <= SHOWN;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    -- C1: Next-state process (case statement)
    process(current_state, platform_x, platform_width_px, disappear_pulse)
    begin
        case current_state is
            when SHOWN =>
                if disappear_pulse = '1' then
                    next_state <= HIDDEN;
                -- Once a platform has completely moved off the left side, hide it.
                elsif (platform_x + platform_width_px) <= 0 then
                    next_state <= HIDDEN;
                else
                    next_state <= SHOWN;
                end if;

            when HIDDEN =>
                next_state <= HIDDEN;

            when others =>
                next_state <= SHOWN;
        end case;
    end process;

    -- C2: Moore output process (state only)
    process(current_state)
    begin
        case current_state is
            when SHOWN =>
                state_visible <= '1';
            when HIDDEN =>
                state_visible <= '0';
            when others =>
                state_visible <= '1';
        end case;
    end process;

    -- Pixel draw condition for the current scan position.
    pixel_on <= '1' when (state_visible = '1' and
                          pixel_x >= platform_x and pixel_x < platform_x + platform_width_px and
                          pixel_y >= PLATFORM_Y and pixel_y < PLATFORM_Y + PLATFORM_HEIGHT_PX)
              else '0';
end Behavioral;
