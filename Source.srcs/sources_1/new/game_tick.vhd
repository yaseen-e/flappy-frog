library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity game_tick is
    Port (
        clk      : in  STD_LOGIC;
        rst      : in  STD_LOGIC;
        enable   : in  STD_LOGIC;
        tick_out : out STD_LOGIC
    );
end game_tick;

architecture Behavioral of game_tick is
    -- 74.25 MHz / 1,237,500 ~= 60 Hz gameplay tick
    constant TICK_MAX : integer := 1237500;

    signal tick_counter : integer range 0 to TICK_MAX - 1 := 0;
    signal tick_reg     : STD_LOGIC := '0';
begin
    -- Emits a one-cycle pulse on tick_out when enabled.
    process(clk)
    begin
        if rising_edge(clk) then
            tick_reg <= '0';

            if rst = '1' then
                tick_counter <= 0;
            elsif enable = '1' then
                if tick_counter = TICK_MAX - 1 then
                    tick_counter <= 0;
                    tick_reg <= '1';
                else
                    tick_counter <= tick_counter + 1;
                end if;
            else
                tick_counter <= 0;
            end if;
        end if;
    end process;

    tick_out <= tick_reg;
end Behavioral;
