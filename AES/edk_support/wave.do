onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /system/aes_ddr_0/aes_clk
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_dout
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_i_aes_cu_s_iter
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_i_aes_error
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_i_aes_ku_regs_out
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg0
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg1
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg2
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg3
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg4
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg5
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg6
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg7
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg8
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg9
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg10
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg11
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_slv_reg12
add wave -noupdate -format Logic /system/aes_ddr_0/splb_clk
add wave -noupdate -format Logic /system/aes_ddr_0/splb_rst
add wave -noupdate -format Logic /system/aes_ddr_0/aes_ddr_0_user_logic_i_aes_valid
add wave -noupdate -format Literal /system/aes_ddr_0/aes_ddr_0_user_logic_i_dout
add wave -noupdate -format Logic /system/aes_ddr_0/aes_ddr_0_user_logic_i_aes_rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {192 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
