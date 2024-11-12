FROM pytorch/pytorch:2.3.1-cuda11.8-cudnn8-devel
#FROM 763104351884.dkr.ecr.eu-central-1.amazonaws.com/pytorch-inference:2.2.0-gpu-py310-cu118-ubuntu20.04-ec2
ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 8.9"
ENV TORCH_NVCC_FLAGS="-Xfatbin -compress-all"


RUN apt-get update
RUN apt-get install -y git ninja-build cmake build-essential libopenblas-dev \
    xterm xauth openssh-server tmux wget mate-desktop-environment-core vim nano
RUN apt-get update && apt-get install --no-install-recommends -y libegl1 libgl1 libgomp1


RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*


#RUN mkdir /workspace

ENV MAX_JOBS=10
RUN cd /workspace && git clone --recursive "https://github.com/NVIDIA/MinkowskiEngine"
RUN cd /workspace/MinkowskiEngine; python setup.py install --force_cuda --blas=openblas




#this line is only for not caching anything

COPY requirements.txt /workspace/3dmatchdiff/
RUN pip install -r /workspace/3dmatchdiff/requirements.txt

COPY . /workspace/3dmatchdiff

WORKDIR /workspace

RUN chmod a+x 3dmatchdiff/testScripts/workstation_run_dgr.sh
ENTRYPOINT ["./3dmatchdiff/testScripts/workstation_run_dgr.sh"]


#RUN cd /workspace && git clone https://github.com/timzarhansen/3dmatchdiff.git
#ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
#RUN #cd /workspace/3dmatchdiff/ && git pull

############################################# stuff for development
# docker run -t -i -d --ipc=host --gpus '"device=0"' --name test -v /home/deeprobotics/dataFolder/3dmatch:/workspace/3dmatch deepregistrationimage:latest
# -d means detatch
# --rm removes container after termination
# docker build -t deepregistrationimage .


















