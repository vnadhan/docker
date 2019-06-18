FROM ubuntu:18.04
MAINTAINER Vishnu <vshgemini@gmail.com>

# Supress warnings about missing front-end. As recommended at:
# http://stackoverflow.com/questions/22466255/is-it-possibe-to-answer-dialog-questions-when-installing-under-docker
ARG DEBIAN_FRONTEND=noninteractive

# Essentials: developer tools, build tools, OpenBLAS
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils git curl vim unzip openssh-client wget \
    build-essential cmake \
    libopenblas-dev

RUN apt-get install -y --no-install-recommends python3.6 python3.6-dev python3-pip python3-tk && \
    pip3 install --no-cache-dir --upgrade pip setuptools

# Pillow and it's dependencies
RUN apt-get install -y --no-install-recommends libjpeg-dev zlib1g-dev && \
    pip3 --no-cache-dir install Pillow

# custom pip packages
RUN pip3 --no-cache-dir install numpy pandas scipy sklearn scikit-image matplotlib Cython requests msgpack-python
RUN pip3 install spacy
RUN pip3 install allennlp
RUN pip3 install torch torchvision

RUN python3 -m spacy download en
