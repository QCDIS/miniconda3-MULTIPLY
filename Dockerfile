FROM continuumio/miniconda3:22.11.1
RUN conda install -c conda-forge mamba conda-merge conda-pack
#RUN wget https://raw.githubusercontent.com/QCDIS/multiply-core/master/environment.yml -O multiply-core-environment.yml
#RUN wget https://raw.githubusercontent.com/QCDIS/data-access/master/environment.yml -O data-access-environment.yml
#RUN wget https://raw.githubusercontent.com/QCDIS/vm-support/master/environment.yml -O vm-support-environment.yml

COPY environment.yml .
#RUN conda-merge multiply-core-environment.yml data-access-environment.yml vm-support-environment.yml environment.yml > merged-environment.yaml
#RUN cat merged-environment.yaml
RUN mamba env update -f environment.yml
SHELL ["conda", "run", "-n", "venv", "/bin/bash", "-c"]
RUN echo "conda activate venv" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

# test packages
RUN python -c "from multiply_data_access import DataAccessComponent"
RUN python -c "from vm_support.utils import create_config_file, set_permissions"
RUN python -c "from vm_support.sym_linker import create_sym_links"
RUN python -c "import glob"
RUN python -c "import pyproj"

