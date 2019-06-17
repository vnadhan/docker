FROM ubuntu:16.04
MAINTAINER Vishnu <vshgemini@gmail.com>

ENV PIP_PACKAGES="numpy pandas msgpack-python scipy sklearn scikit-image matplotlib torch torchvision spacy allennlp pillow zip"

# Essentials: developer tools, build tools, OpenBLAS
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils git curl vim unzip openssh-client wget \
    build-essential cmake \
    libopenblas-dev

# custom pip packages
RUN pip -no-cache-dir install ${PIP_PACKAGES};

RUN python -m spacy download en
