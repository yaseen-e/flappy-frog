library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity game_state_fsm is
    Port (
        clk             : in  STD_LOGIC;
        rst             : in  STD_LOGIC;
        fell_out        : in  STD_LOGIC;
        hit_goal        : in  STD_LOGIC;
        gameplay_enable : out STD_LOGIC;
        soft_reset      : out STD_LOGIC;
        win_pause       : out STD_LOGIC
    );
end game_state_fsm;

architecture Behavioral of game_state_fsm is
    type game_state_t is (GS_RUNNING, GS_SOFT_RESET, GS_WIN_PAUSE);
    signal current_state : game_state_t := GS_RUNNING;
    signal next_state    : game_state_t := GS_RUNNING;
begin
    -- C0: State register
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                current_state <= GS_RUNNING;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    -- C1: Next-state logic
    process(current_state, fell_out, hit_goal)
    begin
        case current_state is
            when GS_RUNNING =>
                if hit_goal = '1' then
                    next_state <= GS_WIN_PAUSE;
                elsif fell_out = '1' then
                    next_state <= GS_SOFT_RESET;
                else
                    next_state <= GS_RUNNING;
                end if;

            when GS_SOFT_RESET =>
                next_state <= GS_RUNNING;

            when GS_WIN_PAUSE =>
                next_state <= GS_WIN_PAUSE;

            when others =>
                next_state <= GS_RUNNING;
        end case;
    end process;

    -- C2: Moore outputs
    process(current_state)
    begin
        gameplay_enable <= '0';
        soft_reset <= '0';
        win_pause <= '0';

        case current_state is
            when GS_RUNNING =>
                gameplay_enable <= '1';
            when GS_SOFT_RESET =>
                soft_reset <= '1';
            when GS_WIN_PAUSE =>
                win_pause <= '1';
            when others =>
                gameplay_enable <= '1';
        end case;
    end process;
end Behavioral;
