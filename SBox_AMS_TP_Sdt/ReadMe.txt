
1 - script_InitTP.tcsh : Start with "source" to source all needed cshrc files
2 - script_ClearSimDir.tcsh : Clear "simulation" directory

3 - script_CompileSBox.tcsh
4 - script_CompileSBoxSynth.tcsh

5 - script_RunNanosim.tcsh : Run nanosim Simulations with K/M given in input_simu_[Key|Mes].txt
script_RunNanosimTpFmr.tcsh : Same script with output in /tp-frm/SBox_AMS/simulations/

6 - script_ConvertFsdb2Txt.tcsh : Convert FSDB traces files into Txt files using CosmosScope 
script_ConvertFsdb2TxtTpFmr.tcsh

7 - script_ImportTraceMatlab.tcsh : Create the M file to be loaded in Matlab to import corresponding data
script_ImportTraceMatlabTpFrm.tcsh
