FROM pytorch/pytorch:2.3.1-cuda11.8-cudnn8-devel

ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 8.9"
ENV TORCH_NVCC_FLAGS="-Xfatbin -compress-all"


RUN apt-get update
RUN apt-get install -y git ninja-build cmake build-essential libopenblas-dev \
    xterm xauth openssh-server tmux wget mate-desktop-environment-core vim nano
RUN apt-get update && apt-get install --no-install-recommends -y libegl1 libgl1 libgomp1


RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

ENV MAX_JOBS=4
RUN git clone --recursive "https://github.com/NVIDIA/MinkowskiEngine"
RUN cd MinkowskiEngine; python setup.py install --force_cuda --blas=openblas
RUN cd /workspace



#this line is only for not caching anything

RUN git clone https://github.com/timzarhansen/3dmatchdiff.git
#ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
RUN cd /workspace/3dmatchdiff/ && git pull
RUN pip install -r /workspace/3dmatchdiff/requirements.txt



#RUN #bash /workspace/3dmatchdiff/deepGlobalRegistration/scripts/download_3dmatch.sh /workspace/data
#
#RUN #wget https://node1.chrischoy.org/data/publications/fcgf/2019-08-16_19-21-47.pth -P /workspace/data/FCGF/
##cd /opt/directory/
#
#
#RUN #conda install --yes --file requirements.txt


#python trainDeepGlobaleRegistration.py --timnoise true --timnoiseval true --timnoisevar 0.05 --out_dir '/workspace/data/results/test1' --threed_match_dir '/workspace/data/threedmatch' --weights '/workspace/data/FCGF/2019-08-16_19-21-47.pth' --use_gpu false

