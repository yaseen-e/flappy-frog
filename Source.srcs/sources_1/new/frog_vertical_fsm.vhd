library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity frog_vertical_fsm is
    Port (
        clk              : in  STD_LOGIC;
        rst              : in  STD_LOGIC;
        tick_en          : in  STD_LOGIC;
        jump_release_enable : in  STD_LOGIC;
        platform_support : in  STD_LOGIC;
        platform_top_y   : in  integer;
        frog_y           : out integer;
        frog_vy          : out integer;
        frog_state       : out STD_LOGIC_VECTOR(1 downto 0);
        jump_takeoff     : out STD_LOGIC;
        fell_out         : out STD_LOGIC
    );
end frog_vertical_fsm;

architecture Behavioral of frog_vertical_fsm is
    constant SCREEN_HEIGHT   : integer := 720;
    constant FROG_HEIGHT     : integer := 90;
    constant START_Y         : integer := 200;
    constant JUMP_VEL        : integer := -15;
    constant MAX_FALL_SPEED  : integer := 6;
    constant ASCEND_GRAV_TICKS  : integer := 2;
    constant DESCEND_GRAV_TICKS : integer := 2;

    constant FROG_STATE_FALLING     : STD_LOGIC_VECTOR(1 downto 0) := "00";
    constant FROG_STATE_ON_PLATFORM : STD_LOGIC_VECTOR(1 downto 0) := "01";
    constant FROG_STATE_JUMPING     : STD_LOGIC_VECTOR(1 downto 0) := "10";

    type vstate_t is (FALLING, ON_PLATFORM, JUMPING);
    signal current_state : vstate_t := FALLING;
    signal y_reg         : integer := START_Y;
    signal vy_reg        : integer := 0;
    signal grav_counter  : integer range 0 to DESCEND_GRAV_TICKS := 0;
    signal fell_out_reg  : STD_LOGIC := '0';
    signal jump_takeoff_reg : STD_LOGIC := '0';
begin
    -- 60 Hz physics update with FSM-based vertical motion.
    process(clk)
        variable vy_next : integer;
        variable gravity_now : integer;
        variable grav_ticks_target : integer;
        variable apply_gravity : boolean;
    begin
        if rising_edge(clk) then
            fell_out_reg <= '0';
            jump_takeoff_reg <= '0';

            if rst = '1' then
                current_state <= FALLING;
                y_reg <= START_Y;
                vy_reg <= 0;
                grav_counter <= 0;
            elsif tick_en = '1' then
                gravity_now := 1;
                if vy_reg < 0 then
                    grav_ticks_target := ASCEND_GRAV_TICKS;
                else
                    grav_ticks_target := DESCEND_GRAV_TICKS;
                end if;

                if grav_counter >= grav_ticks_target - 1 then
                    apply_gravity := true;
                    grav_counter <= 0;
                else
                    apply_gravity := false;
                    grav_counter <= grav_counter + 1;
                end if;

                case current_state is
                    when FALLING =>
                        vy_next := vy_reg;
                        if apply_gravity then
                            vy_next := vy_next + gravity_now;
                        end if;
                        if vy_next > MAX_FALL_SPEED then
                            vy_next := MAX_FALL_SPEED;
                        end if;

                        y_reg <= y_reg + vy_next;
                        vy_reg <= vy_next;

                        if platform_support = '1' and vy_next >= 0 then
                            y_reg <= platform_top_y - FROG_HEIGHT;
                            vy_reg <= 0;
                            current_state <= ON_PLATFORM;
                        elsif y_reg >= (SCREEN_HEIGHT - FROG_HEIGHT) then
                            fell_out_reg <= '1';
                            y_reg <= START_Y;
                            vy_reg <= 0;
                            grav_counter <= 0;
                            current_state <= FALLING;
                        end if;

                    when ON_PLATFORM =>
                        y_reg <= platform_top_y - FROG_HEIGHT;
                        vy_reg <= 0;

                        if platform_support = '0' then
                            current_state <= FALLING;
                        elsif jump_release_enable = '1' then
                            vy_reg <= JUMP_VEL;
                            grav_counter <= 0;
                            jump_takeoff_reg <= '1';
                            current_state <= JUMPING;
                        end if;

                    when JUMPING =>
                        vy_next := vy_reg;
                        if apply_gravity then
                            vy_next := vy_next + gravity_now;
                        end if;
                        if vy_next > MAX_FALL_SPEED then
                            vy_next := MAX_FALL_SPEED;
                        end if;

                        y_reg <= y_reg + vy_next;
                        vy_reg <= vy_next;

                        if vy_next >= 0 then
                            current_state <= FALLING;
                        end if;

                    when others =>
                        current_state <= FALLING;
                        y_reg <= START_Y;
                        vy_reg <= 0;
                        grav_counter <= 0;
                end case;
            end if;
        end if;
    end process;

    frog_y <= y_reg;
    frog_vy <= vy_reg;
    jump_takeoff <= jump_takeoff_reg;
    fell_out <= fell_out_reg;

    with current_state select
        frog_state <= FROG_STATE_FALLING when FALLING,
                      FROG_STATE_ON_PLATFORM when ON_PLATFORM,
                      FROG_STATE_JUMPING when JUMPING,
                      FROG_STATE_FALLING when others;
end Behavioral;
