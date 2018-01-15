source /softslin/vivado_17.1/Vivado/2017.1/settings64.sh
if [ -n "${LM_LICENSE_FILE}" ] ; then
    export LM_LICENSE_FILE="${LM_LICENSE_FILE}:2110@cimekey1"
else
    export LM_LICENSE_FILE="2110@cimekey1"
fi

