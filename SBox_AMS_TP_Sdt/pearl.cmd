# Owner: austriamicrosystems AG  HIT-Kit: Digital
# Default Pearl command file for MS simulation

SetPowerNode "VDD"
SetGroundNode "VSS"
SetLibraryCorner "all"
SetSlewMode "all"
EstimateWireLoads -rc -group "sub_micron" -name "10k" -topology "balanced" 
WriteSDFDelays -delimiter "." -version 3.0 -ns -precision 4
