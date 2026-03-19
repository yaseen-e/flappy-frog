// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Mar  5 15:58:32 2026
// Host        : YaseenLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ rom1kx8_sim_netlist.v
// Design      : rom1kx8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom1kx8,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [7:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.1884 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "rom1kx8.mem" *) 
  (* C_INIT_FILE_NAME = "rom1kx8.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
aMT3usC6uizzcwnzOCX4OsS16Ob+YxFcsGovFpFklbnaIaD1S0lVdxenTwHPp6ByIEi+ehwr6Rgg
z/3AlTheI5NFTM8ihiMA18/wmUxI7EbaftJACA1LykUKCuj5myy0T+DACuv3sGYIZS38TZTZnnBC
FGAlvTZmRWs+JzneH3o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR9ZerhYSAb39nzEkeYvhnwEs5t9y/+yTDf8KuoUtR1BGeHZq8pA/YxtjzQLtaOW1R1IQUb0FtSI
e3CYAb7WHYbIjcpw3vKHvW1SqcGn9CMGa556CYKmD2oF12Kow8xRaFvMSBUVxX7HsHxNWnRd+PU1
+C0YayU2KFIY/7Yl6cZ5luAzhw/6SW3PFYUIyyqWy5MCIXweHOwQR2IpQEdlDur5nluN7i7BeB+i
fxwwHh8TU/g7T4mhZFkiTuBKdLAtQOjxWxzqTMxgcuAjlTylY16FgMFOASdvvSbqBZJjbxMdVloU
rYjS8O/8rWktv8GXcaIdBJ2BRj01q7jsChsbwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Qvl63GHz9mq2xOB7elt/vAQ7URLGdD1Lkcz7f3Wtw31dwjjjbP62Ny/Jr6OmBIheWlgejx38qxAT
TrHiiEyjKmGcnPn1Tn2n+cH4RAxCbOFnCI9n6+YsYMTe9JkplGhGGr39SkFgJz0I2IKpPsuqTjCj
rhf49TAryNMQeRpREJA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MA+9Ro+dh339m0iZrkKbqTKN8gQ5xkxN/SPCfhkOn+5jjgCTS5IOKLHil+HsZDjX333ebxnornwG
MOBxyEdFfLM8SA+bs2r41J/j0af2VVMmCM3hOh8JmZxB4X9Jg/glegNCbvwzqxMbOQNEy+zt7j5t
TFVD82RtPFmYVVYZZyll/WvAA+0aVpyjzLCIM1GznFky0RWLv65Wp4MJJnNRRrtG3muMznVO/u2s
tACsJ9jzv9M0IlMYjYH9BixhG6cZX02I4LEXXaPkhdOINlMMhsbArXtc9NphzmS4bY1/1yF1D6YD
EKLyS2Sr3HDl0O/lefN+jvfG8iKuVl55PNNrVQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wpMTg7STjFkUDhOqdNPa0FHXTnHQgKmhvqDv+rRVBvMiQ8O7u8oj7ibITq3o+jugJsMJ60B410gQ
JFTcqCJKYmYJvqi8rPLLOYDmFG6ZLP/Ixr3n62IyIaCeDltBahi3yV009QN0X+iuzuFCL+Y7g9ff
IvAgyBly+Z3Itv2H9EJMZPMl17Sa7IkgjmWqzVXIKNMKn0iDVYsQw6ZgzQDYQ8N8IvTIEggU3/lh
6Nf0hV0ev3qOv/2P+4w0U766Ux3yLuzPJSI7bKm3/ip9NjhOytxOiKKqVXhKG8dzbbuS5u3EE/eq
q6YxkL7gpvNltVqqBnJB6vHSyWrD6+MqsCtR9A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q7Q4SSp70lxFryaopuic9VVP/Ire0pSsPEIMYdURBAczC7ShkuYeV02U7L3BlAiyBE4vBKcwYSQd
cWiaj8sVP7q4kxoRHKxLV1R5PIO6l4DsLWE2E+1MLyUPME0w5KTular/oX8EPCJ5n/8VCtW7x4Vf
dpeyki1/IAPJkAyi3zVZKHzgKhEwnZaZZtZYuMWoPZMt4V38sAcE42Raf+7yfFWG5HO74JY6iEnW
gJeRk58K+avB/XLF2/j2RQZfjTYizrprT2tUMBK6e7DRWZZtk8AOcsMhUikev44IFGNbNXjP8BXC
0J3y3P7pCFT6l+saU83nRwi/H25fSA34diJtNw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a/8ooC+s+6nfvfa1+oBhsvYWLJjFgp83DI1kNyOi5Am+ugPbGRmgGZudfyo6yw6Yd5gGbLm5aToQ
5G4cGF5HaXD5TU6A0ZZFMTIbzFLE76JMjjIxX8JcaJIZpSmrXqlru8l5gDINUEAmwUY3mRQnjcGJ
0Z+kMRH8iAEF+gEviPiFZSBbJeOPqivIS217kimQJX3BeNbNPQTP+GUidcRywpGMh5avxtA0kDRO
F9SoCSyTm9hr2v9hsK1IUAYQLb7n2/R+z5YNKNzt1oN4qgJH1wZfdI8if2K8+ohyOdnxrrgJOWdj
cOqr7cGqEOYfBMTIQeHVZzb7NGWVN+9B8XSUaQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
FLPvOUNRWNW2GU+FEGmt2XWthOT5bY/31DRbol2cUmEGNF6b2XzpCosNKGx/o2n6sQvGP39KRFCs
nJu0ihe2dUGee9nEZZUcpwPjnEfXVI3yJaRVYy8iL+rm59lXq0jX4sjAPieDvv8shgAnoXLTZGlq
K+2c1JhaHt+nFi27TDrYar/+P8nP1MhocOS7BjzCvSs0foEXj92/qD+71Sm/LqGr8cjlH2qTJJ8B
ynxoH6iT+bksVA2VbtPT9o6h1kJ/zwP4wcsL9l+qSlJhd4GI11JPux26DlNyIi41WmufQcfiT0PB
r6O9+0E9lV9ODwKdjaxfZRK29rjKeq2yr0jWhMV38XKKqHAJli7MIypGRXcCo+u89H87KgYt+ebw
s3foIqCe0JKR57WzI8VD6XdNtOL8eBxK539oemx4vkE0cGYECZKYru6A2hPeZOYDD5eyWSUlQl1R
EciK49WM8HnssyRVcmE6di6bISMbVi0TZG/v98bz+9UZa8DtqMVYH0tz

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fphquQOeFuqByo36Gh2C1zEC1J6u9swSMbMzsKldIvLm+SZ6/hr/N8KJ/G2vBABzX6UtbVuP1ZXx
AxdftP4Aqis1B3Bs6989aQG9eo0SOHA7r6aFLtFb3qoD5Pvqw4aVNU4z4EtTpFpn/jCWD21lKROf
q5X32HRfFq1jwqod+9vIbUNRRzz5y9VHvXfacZlxDazSPmcCF4hxB1KqWqT44KmYVkDedgkgnYgb
ZGidHnTb3W7C8tSqC9ac4kNJCL429QndtddweESJNlpX+65pt9Irok9pkOodwoj0QScswOIFjhBZ
/GrzZLQcFWiD3gXRU4DazzxQnGdRH4qEIRWziw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1lUYYHPCt1BUJOvcBbgMU2GSQiqfxItz4ntieMaenjrtsE9SLwaU6xB0tBl8Atw5yP/RRNww1kX/
9uZbTz5He3r9mPVt+mGxB4N3f9BbCrQRb4USVPgKO/+vWUfMQERGklScy0+fz75WuxH74CjRUoDI
8iyssb2cUNnfDe13jIoI8gM1w4w/Pkxkmb6Mef53QMxacHAWEZeytcH3fuL/adO263D8P90U3XJv
vBXJmbjkRVi9qzjBzfMxuOy2KbZaZgR3BLzaffIfFnMwg/Rb8sGls5pQsZv5jL2wk3+Bj3OXBYdd
pDyjGoalJBzObKzd/t15kNHwY4FXYFcZLQPncw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YRmSEzaa2WFVvMH1BwWc1TIUpVbzSEIP0VbI6n0sEgct/X4PiTfMQmK1jBVCaISIzwBxscKQwZOt
mb/nmINGg6I7ih39LSbBMtx6cdCUiyaLkPeRbqfyPpKhvnUIFmdKVvTd1dYzxeOeuDnhSVaBaAcN
3lngSg7lIbmhLIGjC29yQrBTiLArbVZi6IRGronMK51e3UrYa6GspsznhiuRcXjEb4bHKrJ2CM5Z
BUwA+E9949sQgyOagFZbLVle2ESbwBaoxcAPn2gxfRHlT0leqyLgUGDZLsfArzGzw9BTGzyEG2TR
XOrKFNYRfMXMrnGsBM7acIelY4LdAMgsKgDH/A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20032)
`pragma protect data_block
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
gHGcYMUqwEejCmYWh5hAqeYcLfTdspiaPQ==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
