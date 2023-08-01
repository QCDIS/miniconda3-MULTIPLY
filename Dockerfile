FROM continuumio/miniconda3:23.5.2-0

RUN conda install -c conda-forge mamba conda-merge conda-pack yq
RUN wget https://raw.githubusercontent.com/QCDIS/NaaVRE/main/docker/MULTIPLY/environment.yaml
#COPY environment.yaml .
#RUN yq eval 'del(.dependencies[] | select(.pip != null))' environment.yaml
RUN mamba env update --name venv -f environment.yaml
