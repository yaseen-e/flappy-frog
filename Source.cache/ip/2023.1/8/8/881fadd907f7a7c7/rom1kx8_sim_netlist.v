// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Mar  5 12:18:28 2026
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
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
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
aMkuOzluhTUu4cNeQWiMdbeN41sWEbvvFQ==
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
