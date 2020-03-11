cat SchoolBase.idf ems.idf > Merged.idf
(export FNCS_LOG_STDOUT=yes && exec fncs_broker 4 &> broker.log &)
(export FNCS_LOG_STDOUT=yes && export FNCS_CONFIG_FILE=eplus.yaml && exec EnergyPlus -w ../../support/energyplus/USA_IN_Indianapolis.Intl.AP.724380_TMY3.epw -d output -r Merged.idf &> eplus.log &)
(export FNCS_LOG_STDOUT=yes && exec fncs_player 2d prices.txt &> player.log &)
(export FNCS_LOG_STDOUT=yes && export FNCS_CONFIG_FILE=eplus_json.yaml && exec eplus_json 2d 5m SchoolDualController eplus_eplus_metrics.json  0.10 50 0.006 0.006 &> eplus_json.log &)
(export FNCS_LOG_STDOUT=yes && export FNCS_CONFIG_FILE=tracer.yaml && exec fncs_tracer 2d tracer.out &> tracer.log &)