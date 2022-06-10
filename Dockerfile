FROM nvidia/cuda:11.2.0-runtime-ubuntu20.04

LABEL maintainer="DeepankarAcharyya(deepankaracharyya@gmail.com)"

#Installing python3.7
RUN apt-get update && apt-get install -y software-properties-common gcc && add-apt-repository -y ppa:deadsnakes/ppa

RUN sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget

RUN apt-get update && apt-get install -y python3.7 python3-distutils python3-pip python3-apt

#Installing Jupyter
RUN pip3 install jupyter lab -y

WORKDIR /work_dir
COPY requirements.txt .
RUN pip3 install -r requirements.txt

RUN mkdir DA

CMD [ "jupyter lab --no-browser --notebook-dir /work_dir/DA" ]