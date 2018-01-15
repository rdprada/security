rm -rf lib_SBAMS

vlib lib_SBAMS

vcom -work lib_SBAMS vhd/SBox.vhd
vcom -work lib_SBAMS vhd/SBoxTb.vhd
