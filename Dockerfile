FROM continuumio/miniconda3
RUN apt-get update --allow-releaseinfo-change && apt-get -y install gcc g++
RUN pip remove numpy
RUN apt-get remove python-pip
RUN conda install -c conda-forge conda-pack
COPY environment.yaml .
RUN conda env create -f environment.yaml