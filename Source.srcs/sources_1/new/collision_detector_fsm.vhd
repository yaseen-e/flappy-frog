library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity collision_detector_fsm is
    Port (
        frog_world_x      : in  integer;
        frog_y            : in  integer;
        frog_vy           : in  integer;
        frog_width        : in  integer;
        frog_height       : in  integer;
        p1_x              : in  integer;
        p1_unit           : in  integer range 1 to 4;
        p1_active         : in  STD_LOGIC;
        p2_x              : in  integer;
        p2_unit           : in  integer range 1 to 4;
        p2_active         : in  STD_LOGIC;
        p3_x              : in  integer;
        p3_unit           : in  integer range 1 to 4;
        p3_active         : in  STD_LOGIC;
        p4_x              : in  integer;
        p4_unit           : in  integer range 1 to 4;
        p4_active         : in  STD_LOGIC;
        p5_x              : in  integer;
        p5_unit           : in  integer range 1 to 4;
        p5_active         : in  STD_LOGIC;
        goal_x            : in  integer;
        goal_y            : in  integer;
        goal_width        : in  integer;
        goal_height       : in  integer;
        platform_support  : out STD_LOGIC;
        support_mask      : out STD_LOGIC_VECTOR(4 downto 0);
        platform_top_y    : out integer;
        hit_goal          : out STD_LOGIC
    );
end collision_detector_fsm;

architecture Behavioral of collision_detector_fsm is
    constant PLATFORM_Y          : integer := 500;
    constant PLATFORM_HEIGHT_PX  : integer := 18;
    constant PLATFORM_UNIT_WIDTH : integer := 24;
    constant FROG_COLLISION_WIDTH : integer := 30;

    type int_array_5 is array (0 to 4) of integer;
    type sl_array_5 is array (0 to 4) of STD_LOGIC;
begin
    process(frog_world_x, frog_y, frog_vy, frog_width, frog_height,
            p1_x, p1_unit, p1_active, p2_x, p2_unit, p2_active, p3_x, p3_unit, p3_active,
            p4_x, p4_unit, p4_active, p5_x, p5_unit, p5_active)
        variable support_v    : STD_LOGIC;
        variable top_y_v      : integer;
        variable frog_bottom       : integer;
        variable next_bottom       : integer;
        variable frog_mid_left_x   : integer;
        variable frog_mid_right_x  : integer;
        variable p_x_arr      : int_array_5;
        variable p_width_arr  : int_array_5;
        variable p_active_arr : sl_array_5;
        variable overlap_x    : boolean;
        variable landing      : boolean;
        variable on_surface   : boolean;
        variable i            : integer;
        variable support_mask_v : STD_LOGIC_VECTOR(4 downto 0);
    begin
        support_v := '0';
        top_y_v := PLATFORM_Y;
        support_mask_v := (others => '0');

        p_x_arr(0) := p1_x;
        p_x_arr(1) := p2_x;
        p_x_arr(2) := p3_x;
        p_x_arr(3) := p4_x;
        p_x_arr(4) := p5_x;

        p_width_arr(0) := p1_unit * PLATFORM_UNIT_WIDTH;
        p_width_arr(1) := p2_unit * PLATFORM_UNIT_WIDTH;
        p_width_arr(2) := p3_unit * PLATFORM_UNIT_WIDTH;
        p_width_arr(3) := p4_unit * PLATFORM_UNIT_WIDTH;
        p_width_arr(4) := p5_unit * PLATFORM_UNIT_WIDTH;

        p_active_arr(0) := p1_active;
        p_active_arr(1) := p2_active;
        p_active_arr(2) := p3_active;
        p_active_arr(3) := p4_active;
        p_active_arr(4) := p5_active;

        frog_bottom := frog_y + frog_height;
        frog_mid_left_x := frog_world_x + (frog_width - FROG_COLLISION_WIDTH) / 2;
        frog_mid_right_x := frog_mid_left_x + FROG_COLLISION_WIDTH;

        if frog_vy > 0 then
            next_bottom := frog_bottom + frog_vy;
        else
            next_bottom := frog_bottom;
        end if;

        for i in 0 to 4 loop
            if p_active_arr(i) = '1' then
                overlap_x := (frog_mid_right_x > p_x_arr(i)) and
                             (frog_mid_left_x < p_x_arr(i) + p_width_arr(i));

                on_surface := overlap_x and
                              (frog_bottom >= PLATFORM_Y) and
                              (frog_bottom <= PLATFORM_Y + PLATFORM_HEIGHT_PX);

                if on_surface and support_mask_v = "00000" then
                    support_mask_v(i) := '1';
                end if;

                landing := (frog_vy >= 0) and overlap_x and
                           (frog_bottom <= PLATFORM_Y + PLATFORM_HEIGHT_PX) and
                           (next_bottom >= PLATFORM_Y);

                if support_v = '0' and landing then
                    support_v := '1';
                    top_y_v := PLATFORM_Y;
                    support_mask_v(i) := '1';
                end if;
            end if;
        end loop;

        platform_support <= support_v;
        support_mask <= support_mask_v;
        platform_top_y <= top_y_v;
    end process;

    hit_goal <= '1' when ((frog_world_x + (frog_width + FROG_COLLISION_WIDTH) / 2) > goal_x and
                          (frog_world_x + (frog_width - FROG_COLLISION_WIDTH) / 2) < goal_x + goal_width and
                          frog_y < goal_y + goal_height and
                          frog_y + frog_height > goal_y)
               else '0';
end Behavioral;
