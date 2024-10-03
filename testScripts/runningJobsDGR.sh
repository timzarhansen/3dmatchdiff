#! /bin/bash
numberofepochs=1
validation=True
sleeptimebetweenruns=10
weights='/workspace/3dmatch/models/deepGlobalRegistration/dlModels/2019-08-16_19-21-47.pth'
datasetdir='/workspace/3dmatch/models/deepGlobalRegistration/data/threedmatch'
nn_max_n=250
use_gpu=True
val_max_iter=10

additionalSettings=--max_epoch $numberofepochs --test_valid $validation --threed_match_dir $datasetdir --weights $weights --val_max_iter $val_max_iter --use_gpu $use_gpu

#python mainPredator.py predator/configs/train/indoor.yaml
export OMP_NUM_THREADS=10;
python trainDeepGlobaleRegistration.py --timnoise true --timnoiseval true --timnoisevar 0.05 --out_dir '/workspace/3dmatch/output/deepGlobalRegistration/10' \
$additionalSettings


sleep $sleeptimebetweenruns
python trainDeepGlobaleRegistration.py --timnoise false --timnoiseval true --timnoisevar 0.05 --out_dir '/workspace/3dmatch/output/deepGlobalRegistration/11' \
$additionalSettings

sleep $sleeptimebetweenruns
python trainDeepGlobaleRegistration.py --timnoise true --timnoiseval false --timnoisevar 0.05 --out_dir '/workspace/3dmatch/output/deepGlobalRegistration/12' \
$additionalSettings


sleep $sleeptimebetweenruns
python trainDeepGlobaleRegistration.py --timnoise false --timnoiseval false --timnoisevar 0.05 --out_dir '/workspace/3dmatch/output/deepGlobalRegistration/13' \
$additionalSettings
#--max_epoch $numberofepochs \
#--test_valid $validation \
#--threed_match_dir $datasetdir \
#--weights $weights \
#--val_max_iter $val_max_iter \
#--use_gpu $use_gpu



#python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/5'
#
#python trainDeepGlobaleRegistration.py --timnoise false --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/6'
#
#python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/7'
#
#python trainDeepGlobaleRegistration.py --timnoise false --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/8'