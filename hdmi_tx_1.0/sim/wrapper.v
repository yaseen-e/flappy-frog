`timescale 1ns / 1ps

module wrapper(
    input clk,
    input rst,
    
    output  hdmi_tx_hpd,
    output TMDS_CLK_P,
    output TMDS_CLK_N,
    output  [2:0] TMDS_DATA_P,
    output  [2:0] TMDS_DATA_N
);
    
    wire vga_hsync;
    wire vga_vsync;
    wire [3:0] vga_red;
    wire [3:0] vga_green;
    wire [3:0] vga_blue;
    
    wire pix_clk;
    wire pix_clkx5;
    
    wire locked;
    wire pix_rst;
        
    wire hsync;
    wire vsync;
    wire vde;
    wire [7:0] red;
    wire [7:0] green;
    wire [7:0] blue;
    
    // Signals for Text Generation
    wire [6:0] ascii_char;
    wire [3:0] text_red, text_green, text_blue;
    wire text_intensity; // This represents if the current pixel is "text"
    
    clk_wiz_0 clk_wiz_inst (
        .clk_out1(pix_clk),
        .clk_out2(pix_clkx5),
        .reset(rst),
        .locked(locked),
        .clk_in1(clk)
    );
    
    assign pix_rst = rst | ~locked;
    
    hdmi_tx_v1_0 # (
        .C_RED_WIDTH(8),
        .C_GREEN_WIDTH(8),
        .C_BLUE_WIDTH(8),
        .MODE("HDMI")
    ) hdmi_tx_inst (
        .pix_clk(pix_clk),
        .pix_clkx5(pix_clkx5),
        .pix_clk_locked(locked),
        .rst(rst),
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(vde),
        .aux0_din(4'h0),
        .aux1_din(4'h0),
        .aux2_din(4'h0),
        .ade(1'h0),
        .TMDS_CLK_P(TMDS_CLK_P),
        .TMDS_CLK_N(TMDS_CLK_N),
        .TMDS_DATA_P(TMDS_DATA_P),
        .TMDS_DATA_N(TMDS_DATA_N)
    );

    localparam hs_end = 40;
    localparam hbp_end = 260;
    localparam hfp_begin = 1540;
    localparam hline_end = 1650;
    localparam vs_end = 5;
    localparam vbp_end = 25;
    localparam vfp_begin = 745;
    localparam vline_end = 750;

    reg [11:0] hcount = 12'h0;
    reg [11:0] vcount = 12'h0;

    always @(posedge pix_clk)
    begin
        if (pix_rst == 1'b1)
        begin
            hcount <= 12'h0;
            vcount <= 12'h0;
        end
        else
        begin
            if (hcount == hline_end - 1)
            begin
                hcount <= 12'h0;
                if (vcount == vline_end - 1)
                    vcount <= 12'h0;
                else
                    vcount <= vcount + 1'b1;
            end
            else
            begin
                hcount <= hcount + 1'b1;
                vcount <= vcount;
            end
        end
    end
    
    assign hsync = (hcount >= 0 && hcount < hs_end) ? 1'b1 : 1'b0;
    assign vsync = (vcount >= 0 && vcount < vs_end) ? 1'b1 : 1'b0;
    assign vde = (hcount >= hbp_end && hcount < hfp_begin && vcount >= vbp_end && vcount < vfp_begin) ? 1'b1: 1'b0;
    
    // Rectangle background logic (Doubled Heights)
assign red = (vde == 1'b0) ? 8'h00 :
                 (text_intensity == 1'b1) ? 8'hFF : // <-- Added: Draw White Text
                 (vcount >= 685) ? 8'h9F :  // Bottom Rect 3 (60px)
                 (vcount >= 665) ? 8'h7F :  // Middle Rect 2 (20px)
                 (vcount >= 645) ? 8'h5F :  // Top Rect 1 (20px)
                 8'h3F;                     // Background
                 
    assign green = (vde == 1'b0) ? 8'h00 :
                   (text_intensity == 1'b1) ? 8'hFF : // <-- Added: Draw White Text
                   (vcount >= 685) ? 8'hDF :
                   (vcount >= 665) ? 8'hBF :
                   (vcount >= 645) ? 8'hAF :
                   8'h9F;
                   
    assign blue = (vde == 1'b0) ? 8'h00 :
                  (text_intensity == 1'b1) ? 8'hFF : // <-- Added: Draw White Text
                  (vcount >= 685) ? 8'hFF :
                  (vcount >= 665) ? 8'hDF :
                  (vcount >= 645) ? 8'hCF :
                  8'hBF;
    
    srldelay # (
        .WIDTH(14),
        .TAPS(4'd1)
    ) vga_srldelay (
        .data_i({red[7:4], green[7:4], blue[7:4], hsync, vsync}),
        .data_o({vga_red, vga_green, vga_blue, vga_hsync, vga_vsync}),
        .clk(pix_clk)
    );
    
    assign hdmi_tx_hpd = 1'b1;
    
    // 1. Character Driver: Decides WHAT character is at the current X/Y
    MY_CHAR_DRIVER char_driver_inst (
        .hcount(hcount[10:0]),
        .vcount(vcount[10:0]),
        .ASCII_CHAR(ascii_char)
    );
    
    // 2. Character Generator: Decides if the current PIXEL of that character is ON or OFF
    CHAR_GEN char_gen_inst (
        .clk25(pix_clk),
        .blank(~vde),
        .hcount(hcount[10:0]),
        .vcount(vcount[10:0]),
        .ASCII_CHAR(ascii_char),
        // We only need one output bit to know if we should draw text color or background
        .R3(text_intensity), 
        .R2(), .R1(), .R0(), .G3(), .G2(), .G1(), .G0(), .B3(), .B2(), .B1(), .B0()
    );
    
endmodule