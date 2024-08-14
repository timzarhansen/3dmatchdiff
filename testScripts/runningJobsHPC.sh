#! /bin/bash


#python mainPredator.py predator/configs/train/indoor.yaml

python trainDeepGlobaleRegistration.py --timnoise false --timnoisevar 0.01 --out_dir '~/tensorboard/3dmatch/models/deepGlobalRegistration/1' --weights '~/dataFolder/3dmatch/models/deepGlobalRegistration/dlModels/2019-08-16_19-21-47.pth' --threed_match_dir '~/dataFolder/3dmatch/threedmatch'
#sleep 2m
#python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.05 --out_dir '~/tensorboard/3dmatch/models/deepGlobalRegistration/2' --weights '~/dataFolder/3dmatch/models/deepGlobalRegistration/dlModels/2019-08-16_19-21-47.pth' --threed_match_dir '~/dataFolder/3dmatch/threedmatch'
