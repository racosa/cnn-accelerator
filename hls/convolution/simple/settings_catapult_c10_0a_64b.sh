#
# Mentor Graphics CatapultC synthesis c8_2 University Edition
#
# export MGC_HOME=/softslin/catapultc8_2/Mgc_home/
export MGC_HOME=/softl3/catapultc10_0a/64bit/Mgc_home
export PATH="$PATH:${MGC_HOME}/bin"


if [ -n "${LM_LICENSE_FILE}" ] ; then
    export LM_LICENSE_FILE="${LM_LICENSE_FILE}:1718@cimekey1"
else
    export LM_LICENSE_FILE="1718@cimekey1"
fi


