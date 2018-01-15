#!/bin/bash
#
# MENTOR GRAPHICS ModelSim version 10.5c in native environement
#

export MTI_HOME=/softslin/modelsim10_5c/modeltech
export MODELSIM="$HOME/Security_lab/modelsim.ini"
export PATH="$PATH:$MTI_HOME/`$MTI_HOME/vco`"

if [ -n "${LM_LICENSE_FILE}" ] ; then
    export LM_LICENSE_FILE="${LM_LICENSE_FILE}:1718@cimekey1"
else
    export LM_LICENSE_FILE="1718@cimekey1"
fi



