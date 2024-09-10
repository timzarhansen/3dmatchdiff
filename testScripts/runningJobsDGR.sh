#! /bin/bash


#python mainPredator.py predator/configs/train/indoor.yaml
export OMP_NUM_THREADS=4;
python trainDeepGlobaleRegistration.py --timnoise true --timnoiseval true --timnoisevar 0.05 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/10'
sleep 1m
python trainDeepGlobaleRegistration.py --timnoise false --timnoiseval true --timnoisevar 0.05 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/11'
sleep 1m
python trainDeepGlobaleRegistration.py --timnoise true --timnoiseval false --timnoisevar 0.05 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/12'
sleep 1m
python trainDeepGlobaleRegistration.py --timnoise false --timnoiseval false --timnoisevar 0.05 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/13'

#python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/5'
#
#python trainDeepGlobaleRegistration.py --timnoise false --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/6'
#
#python trainDeepGlobaleRegistration.py --timnoise true --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/7'
#
#python trainDeepGlobaleRegistration.py --timnoise false --timnoisevar 0.01 --out_dir '/home/tim-external/dataFolder/3dmatch/models/deepGlobalRegistration/8'