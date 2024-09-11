#! /bin/bash
numberofepochs=100
validation=True
sleeptimebetweenruns=100
weights='/workspace/3dmatch/models/deepGlobalRegistration/dlModels/2019-08-16_19-21-47.pth'
datasetdir='/workspace/3dmatch/models/deepGlobalRegistration/data/threedmatch'
nn_max_n=250




#python mainPredator.py predator/configs/train/indoor.yaml
export OMP_NUM_THREADS=4;
python trainDeepGlobaleRegistration.py --timnoise true --timnoiseval true --timnoisevar 0.05 --out_dir '/workspace/3dmatch/output/deepGlobalRegistration/10' \
--max_epoch $numberofepochs \
--test_valid $validation \
--threed_match_dir $datasetdir \
--weights $weights

sleep $sleeptimebetweenruns
python trainDeepGlobaleRegistration.py --timnoise false --timnoiseval true --timnoisevar 0.05 --out_dir '/workspace/3dmatch/output/deepGlobalRegistration/11' \
--max_epoch $numberofepochs \
--test_valid $validation \
--threed_match_dir $datasetdir \
--weights $weights

sleep $sleeptimebetweenruns
python trainDeepGlobaleRegistration.py --timnoise true --timnoiseval false --timnoisevar 0.05 --out_dir '/workspace/3dmatch/deepGlobalRegistration/12' \
--max_epoch $numberofepochs \
--test_valid $validation \
--threed_match_dir $datasetdir \
--weights $weights

sleep $sleeptimebetweenruns
python trainDeepGlobaleRegistration.py --timnoise false --timnoiseval false --timnoisevar 0.05 --out_dir '/workspace/3dmatch/deepGlobalRegistration/13' \
--max_epoch $numberofepochs \
--test_valid $validation \
--threed_match_dir $datasetdir \
--weights $weights

#python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/5'
#
#python trainDeepGlobaleRegistration.py --timnoise false --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/6'
#
#python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/7'
#
#python trainDeepGlobaleRegistration.py --timnoise false --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/8'