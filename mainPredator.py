import os, torch, json, argparse, shutil
from easydict import EasyDict as edict

from predator.datasets.dataloader import get_dataloader, get_datasets
from predator.models.architectures import KPFCNN
from predator.lib.utils import setup_seed, load_config
from predator.lib.tester import get_trainer
from predator.lib.loss import MetricLoss
from predator.configs.models import architectures

from torch import optim

setup_seed(0)


if __name__ == '__main__':
    # load configs
    parser = argparse.ArgumentParser()
    parser.add_argument('config', type=str, help= 'Path to the config file.')
    args = parser.parse_args()
    config = load_config(args.config)
    config['snapshot_dir'] = '%s' % config['exp_dir']
    config['tboard_dir'] = '%s/tensorboard' % config['exp_dir']
    config['save_dir'] = '/home/tim-external/dataFolder/3dmatch/models/predator/snapshot/%s/checkpoints' % config['exp_dir']
    config = edict(config)

    os.makedirs(config.snapshot_dir, exist_ok=True)
    os.makedirs(config.save_dir, exist_ok=True)
    os.makedirs(config.tboard_dir, exist_ok=True)
    json.dump(
        config,
        open(os.path.join(config.snapshot_dir, 'config.json'), 'w'),
        indent=4,
    )
    if config.gpu_mode:
        config.device = torch.device('cuda')
    else:
        config.device = torch.device('cpu')
    
    # backup the files
    os.system(f'cp -r predator/models {config.snapshot_dir}')
    os.system(f'cp -r predator/datasets {config.snapshot_dir}')
    os.system(f'cp -r predator/lib {config.snapshot_dir}')
    shutil.copy2('mainPredator.py', config.snapshot_dir)
    
    
    # model initialization
    config.architecture = architectures[config.dataset]
    config.model = KPFCNN(config)

    # create optimizer 
    if config.optimizer == 'SGD':
        config.optimizer = optim.SGD(
            config.model.parameters(), 
            lr=config.lr,
            momentum=config.momentum,
            weight_decay=config.weight_decay,
            )
    elif config.optimizer == 'ADAM':
        config.optimizer = optim.Adam(
            config.model.parameters(), 
            lr=config.lr,
            betas=(0.9, 0.999),
            weight_decay=config.weight_decay,
        )
    
    # create learning rate scheduler
    config.scheduler = optim.lr_scheduler.ExponentialLR(
        config.optimizer,
        gamma=config.scheduler_gamma,
    )
    
    # create dataset and dataloader
    train_set, val_set, benchmark_set = get_datasets(config)
    config.train_loader, neighborhood_limits = get_dataloader(dataset=train_set,
                                        batch_size=config.batch_size,
                                        shuffle=True,
                                        num_workers=config.num_workers,
                                        )
    config.val_loader, _ = get_dataloader(dataset=val_set,
                                        batch_size=config.batch_size,
                                        shuffle=False,
                                        num_workers=1,
                                        neighborhood_limits=neighborhood_limits
                                        )
    config.test_loader, _ = get_dataloader(dataset=benchmark_set,
                                        batch_size=config.batch_size,
                                        shuffle=False,
                                        num_workers=1,
                                        neighborhood_limits=neighborhood_limits)
    
    # create evaluation metrics
    config.desc_loss = MetricLoss(config)
    trainer = get_trainer(config)
    if(config.mode=='train'):
        trainer.train()
    elif(config.mode =='val'):
        trainer.eval()
    else:
        trainer.test()        