load_library c35_CORELIB
read -technology "c35_CORELIB"  { /tima3/maingot/Bricolage/SBox_AMS/SBox.vhd }
pre_optimize -common_logic -unused_logic -boundary -xor_comparator_optimize 
pre_optimize -extract 
optimize .work.sbox.behavioral -target c35_CORELIB -macro -area -effort quick -hierarchy auto 
optimize_timing .work.sbox.behavioral 
set novendor_constraint_file FALSE
auto_write -format VHDL SBox_Synth.vhd
set novendor_constraint_file FALSE
auto_write -format Verilog SBox_Synth.v
