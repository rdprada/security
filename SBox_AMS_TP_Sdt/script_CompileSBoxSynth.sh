rm -rf lib_SBAMSSynth

vlib lib_SBAMSSynth

vcom -work lib_SBAMSSynth synth/SBox_Synth.vhd
vcom -work lib_SBAMSSynth vhd/SBoxTb.vhd
