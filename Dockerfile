FROM continuumio/miniconda3

RUN apt-get update --allow-releaseinfo-change && apt-get -y install git unzip
COPY multiply_environment.yml .
RUN conda env create -f multiply_environment.yml
RUN conda install -c conda-forge conda-pack
RUN conda-pack -n venv -o /tmp/env.tar && \
    mkdir /venv && cd /venv && tar xf /tmp/env.tar && \
    rm /tmp/env.tar
RUN /venv/bin/conda-unpack
