# Owner: austriamicrosystems AG  HIT-Kit: Digital
# Example Pearl command file
SetProcess     0.64:1.00:1.40
SetVoltage     3.6:3.3:3
SetTemperature -50:25:125
SetLibraryCorner all
ReadTLF ${AMS_DIR}/tlf/c35b4_3.3V/c35_CORELIB.tlf
ReadTLF ${AMS_DIR}/tlf/c35b4_3.3V/c35_CORELIB_3B.tlf
ReadTLF ${AMS_DIR}/tlf/c35b4_3.3V/c35_IOLIB_4M.tlf
ReadTLF ${AMS_DIR}/tlf/c35b4_3.3V/c35_IOLIB_3B_4M.tlf
ReadTLF ${AMS_DIR}/tlf/c35b4_3.3V/c35_IOLIBV5_4M.tlf
ReadTLF ${AMS_DIR}/tlf/c35b4_3.3V/c35_IOLIBC_3B_4M.tlf
ReadTLF ${AMS_DIR}/tlf/c35b4_3.3V/c35_IOLIBCV5_3B_4M.tlf
ReadTLF ${AMS_DIR}/tlf/c35b4_3.3V/FILLANT.tlf

# ReadVerilog  TOPLEVEL.v
# TopLevelCell TOPLEVEL
#  or
# ReadSPFNetlist  TOPLEVEL.spf

# EstimateWireloads -rc -topology balanced -group sub_micron -name 10k
#  or
# ReadSPF  -bus_delimiter <> TOPLEVEL.spf

# WriteSDFDelays -version 2.1 -precision 3 -ns -no_negative_delays TOPLEVEL.sdf
# Quit
