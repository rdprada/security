vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/microblaze_v10_0_2
vlib msim/axi_lite_ipif_v3_0_4
vlib msim/mdm_v3_2_9
vlib msim/lib_cdc_v1_0_2
vlib msim/proc_sys_reset_v5_0_11
vlib msim/xlconstant_v1_1_3
vlib msim/interrupt_control_v3_1_4
vlib msim/axi_gpio_v2_0_14
vlib msim/generic_baseblocks_v2_1_0
vlib msim/axi_infrastructure_v1_1_0
vlib msim/axi_register_slice_v2_1_12
vlib msim/fifo_generator_v13_1_4
vlib msim/axi_data_fifo_v2_1_11
vlib msim/axi_crossbar_v2_1_13
vlib msim/lmb_v10_v3_0_9
vlib msim/lmb_bram_if_cntlr_v4_0_11
vlib msim/blk_mem_gen_v8_3_6

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap microblaze_v10_0_2 msim/microblaze_v10_0_2
vmap axi_lite_ipif_v3_0_4 msim/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_9 msim/mdm_v3_2_9
vmap lib_cdc_v1_0_2 msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_11 msim/proc_sys_reset_v5_0_11
vmap xlconstant_v1_1_3 msim/xlconstant_v1_1_3
vmap interrupt_control_v3_1_4 msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_14 msim/axi_gpio_v2_0_14
vmap generic_baseblocks_v2_1_0 msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_12 msim/axi_register_slice_v2_1_12
vmap fifo_generator_v13_1_4 msim/fifo_generator_v13_1_4
vmap axi_data_fifo_v2_1_11 msim/axi_data_fifo_v2_1_11
vmap axi_crossbar_v2_1_13 msim/axi_crossbar_v2_1_13
vmap lmb_v10_v3_0_9 msim/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_11 msim/lmb_bram_if_cntlr_v4_0_11
vmap blk_mem_gen_v8_3_6 msim/blk_mem_gen_v8_3_6

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"/softslin/vivado_17.1/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/softslin/vivado_17.1/Vivado/2017.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/softl2/XILINX/vivado_17.1/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v10_0_2 -64 -93 \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/796f/hdl/microblaze_v10_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_microblaze_0_0/sim/design_1_microblaze_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/0ba0/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_9 -64 -93 \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/359c/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_mdm_1_0/sim/design_1_mdm_1_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_11 -64 -93 \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/sim/design_1_rst_clk_wiz_1_100M_0.vhd" \

vlog -work xlconstant_v1_1_3 -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/45df/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_1_0/sim/design_1_xlconstant_1_0.v" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/e956/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_14 -64 -93 \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/3b45/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_axi_gpio_0_0/sim/design_1_axi_gpio_0_0.vhd" \
"../../../bd/design_1/ipshared/2587/hdl/aes_ddr_v1_0_S00_AXI.vhd" \
"../../../bd/design_1/ipshared/2587/hdl/aes_ddr_v1_0.vhd" \
"../../../bd/design_1/ip/design_1_aes_ddr_1_0/sim/design_1_aes_ddr_1_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/f9c1/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_12 -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/0e33/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_1_4 -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/ebc2/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_4 -64 -93 \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_4 -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.v" \

vlog -work axi_data_fifo_v2_1_11 -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/5235/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_13 -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/78eb/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \

vcom -work lmb_v10_v3_0_9 -64 -93 \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/162e/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_dlmb_v10_0/sim/design_1_dlmb_v10_0.vhd" \
"../../../bd/design_1/ip/design_1_ilmb_v10_0/sim/design_1_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_11 -64 -93 \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/5376/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_dlmb_bram_if_cntlr_0/sim/design_1_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/design_1/ip/design_1_ilmb_bram_if_cntlr_0/sim/design_1_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_3_6 -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/4158/simulation/blk_mem_gen_v8_3.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/65a4" "+incdir+../../../../aes_ddr.srcs/sources_1/bd/design_1/ipshared/7e3a/hdl" \
"../../../bd/design_1/ip/design_1_lmb_bram_0/sim/design_1_lmb_bram_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/hdl/design_1.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

