declare -r TESP_SUPPORT=$TESP_INSTALL/share/support
#declare -r TESP_SUPPORT=/home/tom/src/tesp/support
# echo "$TESP_SUPPORT"

(export FNCS_LOG_STDOUT=yes && exec fncs_broker 4 &> broker.log &)
(export FNCS_LOG_STDOUT=yes && export FNCS_CONFIG_FILE=eplus.yaml && exec energyplus -w $TESP_SUPPORT/energyplus/USA_IN_Indianapolis.Intl.AP.724380_TMY3.epw -d outSchoolBase $TESP_SUPPORT/energyplus/SchoolDualController.idf &> eplus.log &)
(export FNCS_LOG_STDOUT=yes && exec fncs_player 2d prices.txt &> player.log &)
(export FNCS_LOG_STDOUT=yes && export FNCS_CONFIG_FILE=eplus_agent.yaml && exec eplus_agent 2d 5m SchoolDualController eplus_eplus_metrics.json  0.10 50 6 6 &> eplus_agent.log &)
(export FNCS_LOG_STDOUT=yes && export FNCS_CONFIG_FILE=tracer.yaml && exec fncs_tracer 2d tracer.out &> tracer.log &)
