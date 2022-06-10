FROM nvidia/cuda:11.2.0-runtime-ubuntu20.04

LABEL maintainer="DeepankarAcharyya(deepankaracharyya@gmail.com)"

#Installing python3.7
RUN apt-get update && apt-get upgrade -y
RUN apt-get install software-properties-common -y
RUN apt-get update
RUN apt-get install git libcairo2-dev pkg-config ffmpeg -y
RUN apt-get update && apt-get install -y python3.7 python3-distutils python3-pip python3-apt -y
#Installing Jupyter
RUN pip3 install jupyterlab

WORKDIR /work_dir
COPY requirements.txt .
RUN pip3 install -r requirements.txt

RUN mkdir DA

CMD [ "jupyter lab --no-browser --notebook-dir /work_dir/DA" ]