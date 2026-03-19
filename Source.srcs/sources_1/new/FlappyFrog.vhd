library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Used for unsigned arithmetic

entity FlappyFrog is
    Port (
        clk         : in  STD_LOGIC;
        rst         : in  STD_LOGIC;
        
        hdmi_tx_hpd : out STD_LOGIC;
        TMDS_CLK_P  : out STD_LOGIC;
        TMDS_CLK_N  : out STD_LOGIC;
        TMDS_DATA_P : out STD_LOGIC_VECTOR(2 downto 0);
        TMDS_DATA_N : out STD_LOGIC_VECTOR(2 downto 0)
    );
end FlappyFrog;

architecture Behavioral of FlappyFrog is

    -- -------------------------------------------------------------------------
    -- Internal Signals
    -- -------------------------------------------------------------------------
    signal vga_hsync : STD_LOGIC;
    signal vga_vsync : STD_LOGIC;
    signal vga_red   : STD_LOGIC_VECTOR(3 downto 0);
    signal vga_green : STD_LOGIC_VECTOR(3 downto 0);
    signal vga_blue  : STD_LOGIC_VECTOR(3 downto 0);
    
    signal pix_clk   : STD_LOGIC;
    signal pix_clkx5 : STD_LOGIC;
    
    signal locked    : STD_LOGIC;
    signal pix_rst   : STD_LOGIC;
        
    signal hsync     : STD_LOGIC;
    signal vsync     : STD_LOGIC;
    signal vde       : STD_LOGIC;
    signal blank     : STD_LOGIC;
    
    signal red       : STD_LOGIC_VECTOR(7 downto 0);
    signal green     : STD_LOGIC_VECTOR(7 downto 0);
    signal blue      : STD_LOGIC_VECTOR(7 downto 0);
    
    -- Signals for Text Generation
    signal ascii_char     : STD_LOGIC_VECTOR(6 downto 0);
    signal text_intensity : STD_LOGIC;
    
    -- Timing Constants
    constant hs_end    : integer := 40;
    constant hbp_end   : integer := 260;
    constant hfp_begin : integer := 1540;
    constant hline_end : integer := 1650;
    constant vs_end    : integer := 5;
    constant vbp_end   : integer := 25;
    constant vfp_begin : integer := 745;
    constant vline_end : integer := 750;

    -- Counters (Using unsigned for arithmetic operations)
    signal hcount : unsigned(11 downto 0) := (others => '0');
    signal vcount : unsigned(11 downto 0) := (others => '0');

    -- Signal for srldelay mapping
    signal srl_data_i : STD_LOGIC_VECTOR(13 downto 0);
    signal srl_data_o : STD_LOGIC_VECTOR(13 downto 0);
    
    -- Signals for component mapping type conversions
    signal hcount_vec : STD_LOGIC_VECTOR(10 downto 0);
    signal vcount_vec : STD_LOGIC_VECTOR(10 downto 0);

    -- -------------------------------------------------------------------------
    -- Frog Constants and Signals
    -- -------------------------------------------------------------------------
    -- Sprite location is in active-video coordinates (0..1279, 0..719)
    constant FROG_X      : integer := 100;
    constant FROG_Y      : integer := 200;
    constant FROG_WIDTH  : integer := 90;
    constant FROG_HEIGHT : integer := 90;

    signal frog_rom_addr : STD_LOGIC_VECTOR(15 downto 0);
    signal frog_rom_data : STD_LOGIC_VECTOR(11 downto 0);
    signal is_frog       : STD_LOGIC := '0';
    signal is_frog_delay : STD_LOGIC := '0';
    signal draw_frog     : STD_LOGIC;

    -- -------------------------------------------------------------------------
    -- Component Declarations
    -- -------------------------------------------------------------------------
    component clk_wiz_0
        Port (
            clk_in1  : in  STD_LOGIC;
            reset    : in  STD_LOGIC;
            clk_out1 : out STD_LOGIC;
            clk_out2 : out STD_LOGIC;
            locked   : out STD_LOGIC
        );
    end component;

    component hdmi_tx_v1_0
        Generic (
            C_RED_WIDTH   : integer := 8;
            C_GREEN_WIDTH : integer := 8;
            C_BLUE_WIDTH  : integer := 8;
            MODE          : string  := "HDMI"
        );
        Port (
            pix_clk        : in  STD_LOGIC;
            pix_clkx5      : in  STD_LOGIC;
            pix_clk_locked : in  STD_LOGIC;
            rst            : in  STD_LOGIC;
            red            : in  STD_LOGIC_VECTOR(7 downto 0);
            green          : in  STD_LOGIC_VECTOR(7 downto 0);
            blue           : in  STD_LOGIC_VECTOR(7 downto 0);
            hsync          : in  STD_LOGIC;
            vsync          : in  STD_LOGIC;
            vde            : in  STD_LOGIC;
            aux0_din       : in  STD_LOGIC_VECTOR(3 downto 0);
            aux1_din       : in  STD_LOGIC_VECTOR(3 downto 0);
            aux2_din       : in  STD_LOGIC_VECTOR(3 downto 0);
            ade            : in  STD_LOGIC;
            TMDS_CLK_P     : out STD_LOGIC;
            TMDS_CLK_N     : out STD_LOGIC;
            TMDS_DATA_P    : out STD_LOGIC_VECTOR(2 downto 0);
            TMDS_DATA_N    : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    component srldelay
        Generic (
            WIDTH : integer := 1;
            TAPS  : std_logic_vector(3 downto 0) := "1111"
        );
        Port (
            clk    : in  STD_LOGIC;
            data_i : in  STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
            data_o : out STD_LOGIC_VECTOR(WIDTH - 1 downto 0)
        );
    end component;

    component MY_CHAR_DRIVER
        Port ( 
            hcount     : in  STD_LOGIC_VECTOR(10 downto 0);
            vcount     : in  STD_LOGIC_VECTOR(10 downto 0);
            ASCII_CHAR : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    component CHAR_GEN
        Port (
            clk25      : in  STD_LOGIC;
            blank      : in  STD_LOGIC;
            hcount     : in  STD_LOGIC_VECTOR(10 downto 0);
            vcount     : in  STD_LOGIC_VECTOR(10 downto 0);
            ASCII_CHAR : in  STD_LOGIC_VECTOR(6 downto 0);
            R3, R2, R1, R0 : out STD_LOGIC;
            G3, G2, G1, G0 : out STD_LOGIC;
            B3, B2, B1, B0 : out STD_LOGIC
        );
    end component;

    component blk_mem_gen_0
        PORT (
            clka  : IN STD_LOGIC;
            addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
        );
    end component;

begin

    -- Reset logic
    pix_rst <= rst or (not locked);
    blank   <= not vde;
    
    -- Conversion from unsigned to std_logic_vector for submodules
    hcount_vec <= std_logic_vector(hcount(10 downto 0));
    vcount_vec <= std_logic_vector(vcount(10 downto 0));

    -- -------------------------------------------------------------------------
    -- Clocking Wizard Instantiation
    -- -------------------------------------------------------------------------
    clk_wiz_inst : clk_wiz_0
        Port Map (
            clk_in1  => clk,
            reset    => rst,
            clk_out1 => pix_clk,
            clk_out2 => pix_clkx5,
            locked   => locked
        );

    -- -------------------------------------------------------------------------
    -- Pixel Counters Process
    -- -------------------------------------------------------------------------
    process(pix_clk)
    begin
        if rising_edge(pix_clk) then
            if pix_rst = '1' then
                hcount <= (others => '0');
                vcount <= (others => '0');
            else
                if hcount = (hline_end - 1) then
                    hcount <= (others => '0');
                    if vcount = (vline_end - 1) then
                        vcount <= (others => '0');
                    else
                        vcount <= vcount + 1;
                    end if;
                else
                    hcount <= hcount + 1;
                end if;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    -- Sync and VDE Generation
    -- -------------------------------------------------------------------------
    hsync <= '1' when (hcount >= 0 and hcount < hs_end) else '0';
    vsync <= '1' when (vcount >= 0 and vcount < vs_end) else '0';
    vde   <= '1' when (hcount >= hbp_end and hcount < hfp_begin and 
                       vcount >= vbp_end and vcount < vfp_begin) else '0';

    -- -------------------------------------------------------------------------
    -- Frog ROM and Address Calculation
    -- -------------------------------------------------------------------------
    frog_rom_inst : blk_mem_gen_0
      PORT MAP (
        clka  => pix_clk,
        addra => frog_rom_addr,
        douta => frog_rom_data
      );

    process(pix_clk)
        variable x_offset : integer;
        variable y_offset : integer;
        variable x_active : integer;
        variable y_active : integer;
    begin
        if rising_edge(pix_clk) then
            -- Convert full timing counters to active-video coordinates.
            x_active := to_integer(hcount) - hbp_end;
            y_active := to_integer(vcount) - vbp_end;

            -- Check sprite bounds only inside active video.
            if (vde = '1' and
                x_active >= FROG_X and x_active < FROG_X + FROG_WIDTH and
                y_active >= FROG_Y and y_active < FROG_Y + FROG_HEIGHT) then
                
                is_frog <= '1';
                x_offset := x_active - FROG_X;
                y_offset := y_active - FROG_Y;
                
                -- Convert 2D (X,Y) coordinate to 1D ROM address: (Y * Width) + X
                frog_rom_addr <= std_logic_vector(to_unsigned(y_offset * FROG_WIDTH + x_offset, 16));
            else
                is_frog <= '0';
            end if;

            -- Delay is_frog by 1 cycle because the Block ROM takes 1 clock cycle to fetch data
            is_frog_delay <= is_frog;
        end if;
    end process;

    -- Determine if we should draw the frog (using "011110111110" as the transparent background color)
    draw_frog <= '1' when is_frog_delay = '1' and frog_rom_data /= "011110111110" else '0';

    -- -------------------------------------------------------------------------
    -- Color Logic (Frog, Text & Background Rectangles)
    -- -------------------------------------------------------------------------
    red <= x"00" when vde = '0' else
           frog_rom_data(11 downto 8) & frog_rom_data(11 downto 8) when draw_frog = '1' else
           x"FF" when text_intensity = '1' else
           x"9F" when vcount >= 685 else
           x"7F" when vcount >= 665 else
           x"5F" when vcount >= 645 else
           x"3F";

    green <= x"00" when vde = '0' else
             frog_rom_data(7 downto 4) & frog_rom_data(7 downto 4) when draw_frog = '1' else
             x"FF" when text_intensity = '1' else
             x"DF" when vcount >= 685 else
             x"BF" when vcount >= 665 else
             x"AF" when vcount >= 645 else
             x"9F";

    blue <= x"00" when vde = '0' else
            frog_rom_data(3 downto 0) & frog_rom_data(3 downto 0) when draw_frog = '1' else
            x"FF" when text_intensity = '1' else
            x"FF" when vcount >= 685 else
            x"DF" when vcount >= 665 else
            x"CF" when vcount >= 645 else
            x"BF";

    -- -------------------------------------------------------------------------
    -- SRL Delay (Synchronize VGA signals)
    -- -------------------------------------------------------------------------
    srl_data_i <= red(7 downto 4) & green(7 downto 4) & blue(7 downto 4) & hsync & vsync;
    
    vga_srldelay : srldelay
        Generic Map (
            WIDTH => 14,
            TAPS  => "0001" -- Equivalent to 4'd1
        )
        Port Map (
            clk    => pix_clk,
            data_i => srl_data_i,
            data_o => srl_data_o
        );
        
    -- Map delayed outputs to internal VGA wires
    vga_red   <= srl_data_o(13 downto 10);
    vga_green <= srl_data_o(9 downto 6);
    vga_blue  <= srl_data_o(5 downto 2);
    vga_hsync <= srl_data_o(1);
    vga_vsync <= srl_data_o(0);

    -- -------------------------------------------------------------------------
    -- HDMI IP Instantiation
    -- -------------------------------------------------------------------------
    hdmi_tx_inst : hdmi_tx_v1_0
        Generic Map (
            C_RED_WIDTH   => 8,
            C_GREEN_WIDTH => 8,
            C_BLUE_WIDTH  => 8,
            MODE          => "HDMI"
        )
        Port Map (
            pix_clk        => pix_clk,
            pix_clkx5      => pix_clkx5,
            pix_clk_locked => locked,
            rst            => rst,
            red            => red,
            green          => green,
            blue           => blue,
            hsync          => hsync,
            vsync          => vsync,
            vde            => vde,
            aux0_din       => x"0",
            aux1_din       => x"0",
            aux2_din       => x"0",
            ade            => '0',
            TMDS_CLK_P     => TMDS_CLK_P,
            TMDS_CLK_N     => TMDS_CLK_N,
            TMDS_DATA_P    => TMDS_DATA_P,
            TMDS_DATA_N    => TMDS_DATA_N
        );

    hdmi_tx_hpd <= '1';

    -- -------------------------------------------------------------------------
    -- Text Generation Modules
    -- -------------------------------------------------------------------------
    char_driver_inst : MY_CHAR_DRIVER
        Port Map (
            hcount     => hcount_vec,
            vcount     => vcount_vec,
            ASCII_CHAR => ascii_char
        );
        
    char_gen_inst : CHAR_GEN
        Port Map (
            clk25      => pix_clk,
            blank      => blank,
            hcount     => hcount_vec,
            vcount     => vcount_vec,
            ASCII_CHAR => ascii_char,
            R3         => text_intensity,
            R2 => open, R1 => open, R0 => open,
            G3 => open, G2 => open, G1 => open, G0 => open,
            B3 => open, B2 => open, B1 => open, B0 => open
        );

end Behavioral;
