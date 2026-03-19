library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity frog_vertical_fsm is
    Port (
        clk              : in  STD_LOGIC;
        rst              : in  STD_LOGIC;
        tick_en          : in  STD_LOGIC;
        platform_support : in  STD_LOGIC;
        platform_top_y   : in  integer;
        frog_y           : out integer;
        frog_vy          : out integer;
        frog_state       : out STD_LOGIC_VECTOR(1 downto 0);
        fell_out         : out STD_LOGIC
    );
end frog_vertical_fsm;

architecture Behavioral of frog_vertical_fsm is
    constant SCREEN_HEIGHT   : integer := 720;
    constant FROG_HEIGHT     : integer := 90;
    constant START_Y         : integer := 200;
    constant JUMP_VEL        : integer := -14;
    constant GRAVITY         : integer := 1;
    constant MAX_FALL_SPEED  : integer := 12;
    constant JUMP_PREP_TICKS : integer := 4;

    type vstate_t is (FALLING, ON_PLATFORM, JUMPING);
    signal current_state : vstate_t := FALLING;
    signal y_reg         : integer := START_Y;
    signal vy_reg        : integer := 0;
    signal prep_counter  : integer range 0 to JUMP_PREP_TICKS := 0;
    signal fell_out_reg  : STD_LOGIC := '0';
begin
    process(clk)
        variable vy_next : integer;
    begin
        if rising_edge(clk) then
            fell_out_reg <= '0';

            if rst = '1' then
                current_state <= FALLING;
                y_reg <= START_Y;
                vy_reg <= 0;
                prep_counter <= 0;
            elsif tick_en = '1' then
                case current_state is
                    when FALLING =>
                        vy_next := vy_reg + GRAVITY;
                        if vy_next > MAX_FALL_SPEED then
                            vy_next := MAX_FALL_SPEED;
                        end if;

                        y_reg <= y_reg + vy_next;
                        vy_reg <= vy_next;

                        if platform_support = '1' and vy_next >= 0 then
                            y_reg <= platform_top_y - FROG_HEIGHT;
                            vy_reg <= 0;
                            prep_counter <= 0;
                            current_state <= ON_PLATFORM;
                        elsif y_reg >= (SCREEN_HEIGHT - FROG_HEIGHT) then
                            fell_out_reg <= '1';
                            y_reg <= START_Y;
                            vy_reg <= 0;
                            prep_counter <= 0;
                            current_state <= FALLING;
                        end if;

                    when ON_PLATFORM =>
                        y_reg <= platform_top_y - FROG_HEIGHT;
                        vy_reg <= 0;

                        if platform_support = '0' then
                            current_state <= FALLING;
                            prep_counter <= 0;
                        elsif prep_counter >= JUMP_PREP_TICKS then
                            vy_reg <= JUMP_VEL;
                            prep_counter <= 0;
                            current_state <= JUMPING;
                        else
                            prep_counter <= prep_counter + 1;
                        end if;

                    when JUMPING =>
                        vy_next := vy_reg + GRAVITY;
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
                        prep_counter <= 0;
                end case;
            end if;
        end if;
    end process;

    frog_y <= y_reg;
    frog_vy <= vy_reg;
    fell_out <= fell_out_reg;

    with current_state select
        frog_state <= "00" when FALLING,
                      "01" when ON_PLATFORM,
                      "10" when JUMPING,
                      "00" when others;
end Behavioral;
