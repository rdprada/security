rm -rf lib_aes
vlib lib_aes
vmap lib_aes ./lib_aes 
vcom -work lib_aes ~/Security_lab/AES/synth/ise/netgen/translate/aes_core_translate.vhd
rm -rf lib_bench
vlib lib_bench
vmap lib_bench ./lib_bench
vcom -work lib_bench ~/Security_lab/AES/bench/test_core_glob.vhd
vsim lib_bench.test_core
add wave sim:/test_core/*
run 4050 ns

