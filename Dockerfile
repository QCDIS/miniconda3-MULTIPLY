FROM continuumio/miniconda3 AS build
RUN apt-get update --allow-releaseinfo-change && apt-get -y install gcc g++

RUN git clone https://github.com/JorisTimmermans/Deploy_MULTIPLY.git
WORKDIR Deploy_MULTIPLY
RUN conda env create -f environments/environment_multiply_platform.yml
RUN conda-pack -n multiply-platform -o /tmp/env.tar && \
    mkdir /venv && cd /venv && tar xf /tmp/env.tar && \
    rm /tmp/env.tar
RUN /venv/bin/conda-unpack
