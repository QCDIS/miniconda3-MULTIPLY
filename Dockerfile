FROM continuumio/miniconda3

COPY environment.yml .
RUN conda env update -f environment.yml

