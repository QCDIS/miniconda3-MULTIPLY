FROM qcdis/miniconda3-pdal:v0.4

COPY environment.yml .
RUN conda env update -f environment.yml

