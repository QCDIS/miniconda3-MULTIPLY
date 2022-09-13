FROM continuumio/miniconda3
RUN apt-get update --allow-releaseinfo-change && apt-get -y install gcc g++
COPY environment.yaml .
RUN conda env create -f environment.yaml
RUN conda install -c conda-forge conda-pack
