FROM ubuntu:16.04
MAINTAINER Vishnu <vshgemini@gmail.com>

ENV PIP_PACKAGES="numpy pandas msgpack-python scipy sklearn scikit-image matplotlib torch torchvision spacy allennlp pillow zip"

# Essentials: developer tools, build tools, OpenBLAS
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils git curl vim unzip openssh-client wget \
    build-essential cmake \
    libopenblas-dev

RUN apt-get install -y --no-install-recommends python3.5 python3.5-dev python3-pip python3-tk && \
    pip3 install --no-cache-dir --upgrade pip setuptools

# custom pip packages
RUN pip3 install ${PIP_PACKAGES};

RUN python3 -m spacy download en
