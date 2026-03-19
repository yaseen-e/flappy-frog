library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Debouncer is
    Port ( 
        clk     : in STD_LOGIC;
        btn_in  : in STD_LOGIC;
        btn_out : out STD_LOGIC
    );
end Debouncer;

architecture Behavioral of Debouncer is
    -- 1,000,000 cycles @ 100MHz = 10ms debounce time
    constant TIMEOUT : integer := 1000000; 
    signal counter   : integer range 0 to TIMEOUT := 0;
    signal stable_val : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if btn_in = stable_val then
                -- Input matches our current output? Reset timer.
                counter <= 0;
            else
                -- Input is different? Start counting.
                counter <= counter + 1;
                if counter = TIMEOUT then
                    -- If held long enough, accept new value
                    stable_val <= btn_in;
                    counter <= 0;
                end if;
            end if;
        end if;
    end process;
    
    btn_out <= stable_val;
end Behavioral;