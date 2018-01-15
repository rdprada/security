source /softslin/ise_edk_147i/14.7/ISE_DS/settings64.sh

# export XILINXD_LICENSE_FILE=${LM_LICENSE_FILE}

if [ -n "${LM_LICENSE_FILE}" ] ; then
    export LM_LICENSE_FILE="${LM_LICENSE_FILE}:2110@cimekey1"
else
    export LM_LICENSE_FILE="2110@cimekey1"
fi


