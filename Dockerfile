FROM continuumio/miniconda3

RUN apt-get update --allow-releaseinfo-change && apt-get -y install git unzip
RUN conda install conda-build
RUN conda update -n base -c defaults conda -y

COPY multiply_environment.yml .
RUN conda env create -f multiply_environment.yml
RUN conda install -c conda-forge conda-pack

RUN conda activate multiply-platform

#==================atmospheric_correction================
RUN mkdir "atmospheric_correction"
WORKDIR atmospheric_correction
COPY meta_atmospheric_correction.yaml .
RUN mv meta_atmospheric_correction.yaml meta.yaml
RUN conda build . --channel conda-forge

#====================================================


#RUN conda-pack -n multiply-platform -o /tmp/env.tar && \
#    mkdir /venv && cd /venv && tar xf /tmp/env.tar && \
#    rm /tmp/env.tar
#RUN /venv/bin/conda-unpack
