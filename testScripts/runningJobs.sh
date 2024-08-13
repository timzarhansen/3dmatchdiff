#! /bin/bash


#python mainPredator.py predator/configs/train/indoor.yaml

python trainDeepGlobaleRegistration.py --timnoise false --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/1'
sleep 5m
python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.05 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/2'
sleep 5m
python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/3'
sleep 5m
python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.1 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/4'

#python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/5'
#
#python trainDeepGlobaleRegistration.py --timnoise false --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/6'
#
#python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/7'
#
#python trainDeepGlobaleRegistration.py --timnoise false --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/8'