#!/bin/bash

# clear
SIM_ROOT="/tesp"
# ==================================================== setting up the FNCS environment ================================================
# FNCS broker
fncsBroker="tcp://*:5570"
# FNCS installation folder
fncsDir="${SIM_ROOT}/FNCSInstall/bin"
FNCSROOT="${SIM_ROOT}/FNCSInstall"
echo "---------------------------------------------"
if test -z $LD_LIBRARY_PATH
then
  LD_LIBRARY_PATH=.:$FNCSROOT/lib
else
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FNCSROOT/lib
fi    
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FNCSROOT/bin
export LD_LIBRARY_PATH
echo $LD_LIBRARY_PATH
echo "======================================================"

if test -z $FNCS_LIBRARY
then
  FNCS_LIBRARY=$FNCSROOT/lib
else
  FNCS_LIBRARY=$FNCSROOT/lib
fi    
export FNCS_LIBRARY
echo $FNCS_LIBRARY
echo "======================================================"

# Energy Plus installation folder
epDir="${SIM_ROOT}/EnergyPlusInstall"
epRunDir="${epDir}/Products"
# Energy Plus JSON installation folder
epjDir="${SIM_ROOT}/EPlusJSONInstall"
epjRunDir="${epjDir}/bin"

PATH=$PATH:${fncsDir}:${epRunDir}:${epjRunDir}
export PATH
echo $PATH

python3 ./examples/te30/gui.py &

exit 0
