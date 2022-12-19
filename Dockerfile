FROM qcdis/miniconda3-pdal

COPY environment.yml .
RUN conda env update -f environment.yml

