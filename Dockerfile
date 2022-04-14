FROM continuumio/miniconda3 AS build
RUN apt-get update --allow-releaseinfo-change && apt-get -y install gcc g++
RUN conda install -c conda-forge conda-pack
RUN git clone https://github.com/JorisTimmermans/Deploy_MULTIPLY.git
WORKDIR Deploy_MULTIPLY
RUN conda env create -f environments/environment_multiply_platform.yml
