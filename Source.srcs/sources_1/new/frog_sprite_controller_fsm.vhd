library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity frog_sprite_controller_fsm is
	Port (
		clk                 : in  STD_LOGIC;
		rst                 : in  STD_LOGIC;
		tick_en             : in  STD_LOGIC;
		platform_support    : in  STD_LOGIC;
		frog_state          : in  STD_LOGIC_VECTOR(1 downto 0);
		hit_goal            : in  STD_LOGIC;
		use_goofy_sprite    : out STD_LOGIC;
		jump_release_enable : out STD_LOGIC
	);
end frog_sprite_controller_fsm;

architecture Behavioral of frog_sprite_controller_fsm is
	constant DELAY_TICKS      : integer := 15;
	constant GOAL_TOGGLE_MAX  : integer := 10;
	constant FROG_STATE_ON_PLATFORM : STD_LOGIC_VECTOR(1 downto 0) := "01";

	type state_t is (SC_NORMAL, SC_PREJUMP_DELAY, SC_WAIT_JUMP_START, SC_GOAL_CYCLE, SC_GOAL_HOLD);

	signal current_state      : state_t := SC_NORMAL;
	signal delay_counter      : integer range 0 to DELAY_TICKS := 0;
	signal goal_toggle_count  : integer range 0 to GOAL_TOGGLE_MAX := 0;
	signal use_goofy_reg      : STD_LOGIC := '0';
	signal jump_release_reg   : STD_LOGIC := '0';

begin
	-- Controls jump-release delay and post-goal sprite alternation policy.
	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				current_state <= SC_NORMAL;
				delay_counter <= 0;
				goal_toggle_count <= 0;
				use_goofy_reg <= '0';
				jump_release_reg <= '0';
			elsif tick_en = '1' then
				case current_state is
					when SC_NORMAL =>
						use_goofy_reg <= '0';
						jump_release_reg <= '0';
						delay_counter <= 0;
						goal_toggle_count <= 0;

						if hit_goal = '1' then
							current_state <= SC_GOAL_CYCLE;
							use_goofy_reg <= '1';
						elsif frog_state = FROG_STATE_ON_PLATFORM and platform_support = '1' then
							current_state <= SC_PREJUMP_DELAY;
							use_goofy_reg <= '1';
						end if;

					when SC_PREJUMP_DELAY =>
						use_goofy_reg <= '1';
						jump_release_reg <= '0';

						if hit_goal = '1' then
							current_state <= SC_GOAL_CYCLE;
							delay_counter <= 0;
							goal_toggle_count <= 0;
							use_goofy_reg <= '1';
						elsif frog_state /= FROG_STATE_ON_PLATFORM or platform_support = '0' then
							current_state <= SC_NORMAL;
							use_goofy_reg <= '0';
							delay_counter <= 0;
						elsif delay_counter >= DELAY_TICKS - 1 then
							current_state <= SC_WAIT_JUMP_START;
							delay_counter <= 0;
							use_goofy_reg <= '0';
							jump_release_reg <= '1';
						else
							delay_counter <= delay_counter + 1;
						end if;

					when SC_WAIT_JUMP_START =>
						use_goofy_reg <= '0';

						if hit_goal = '1' then
							current_state <= SC_GOAL_CYCLE;
							delay_counter <= 0;
							goal_toggle_count <= 0;
							use_goofy_reg <= '1';
							jump_release_reg <= '0';
						elsif frog_state /= FROG_STATE_ON_PLATFORM or platform_support = '0' then
							current_state <= SC_NORMAL;
							jump_release_reg <= '0';
						else
							jump_release_reg <= '1';
						end if;

					when SC_GOAL_CYCLE =>
						jump_release_reg <= '0';

						if delay_counter >= DELAY_TICKS - 1 then
							delay_counter <= 0;
							if goal_toggle_count >= GOAL_TOGGLE_MAX - 1 then
								current_state <= SC_GOAL_HOLD;
								use_goofy_reg <= '0';
							else
								goal_toggle_count <= goal_toggle_count + 1;
								use_goofy_reg <= not use_goofy_reg;
							end if;
						else
							delay_counter <= delay_counter + 1;
						end if;

					when SC_GOAL_HOLD =>
						use_goofy_reg <= '0';
						jump_release_reg <= '0';

					when others =>
						current_state <= SC_NORMAL;
						use_goofy_reg <= '0';
						jump_release_reg <= '0';
						delay_counter <= 0;
						goal_toggle_count <= 0;
				end case;
			end if;
		end if;
	end process;

	use_goofy_sprite <= use_goofy_reg;
	jump_release_enable <= jump_release_reg;

end Behavioral;
