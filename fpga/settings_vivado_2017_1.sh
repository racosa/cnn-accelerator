
#source /softslin/vivado_15.2/Vivado/2015.2/settings64.sh
# source /home/local/vivado2016_1_0409_1/Vivado/2016.1/settings64.sh
# source /home/local/VIVADO2017_v2/Vivado/2017.1/settings64.sh
source /softslin/vivado_17.1/Vivado/2017.1/settings64.sh
source /softslin/vivado_17.1/SDK/2017.1/settings64.sh

# export XILINXD_LICENSE_FILE=${LM_LICENSE_FILE}

if [ -n "${LM_LICENSE_FILE}" ] ; then
    export LM_LICENSE_FILE="${LM_LICENSE_FILE}:2110@cimekey1"
else
    export LM_LICENSE_FILE="2110@cimekey1"
fi

if [ -n "${LM_LICENSE_FILE}" ] ; then
    export LM_LICENSE_FILE="${LM_LICENSE_FILE}:/rech/cimel/rollandl/.Xilinx/license_pr_cimepc86.lic"
else
    export LM_LICENSE_FILE="2110@cimekey1:/rech/cimel/rollandl/.Xilinx/license_pr_cimepc86.lic"
fi

