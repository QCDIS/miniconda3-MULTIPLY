FROM continuumio/miniconda3
RUN apt-get update --allow-releaseinfo-change && apt-get -y install gcc g++
COPY environment.yaml .
RUN conda env create -f environment.yaml
RUN conda install -c conda-forge conda-pack
RUN conda-pack -n venv -o /tmp/env.tar && \
    mkdir /venv && cd /venv && tar xf /tmp/env.tar && \
    rm /tmp/env.tar
RUN /venv/bin/conda-unpack