FROM condaforge/mambaforge:22.11.1-4
RUN conda install -c conda-forge mamba conda-merge conda-pack
#RUN wget https://raw.githubusercontent.com/QCDIS/NaaVRE/main/docker/MULTIPLY/environment.yaml
COPY environment.yaml .
RUN mamba env update -f environment.yaml
#SHELL ["conda", "run", "-n", "venv", "/bin/bash", "-c"]
#RUN echo "conda activate venv" >> ~/.bashrc
#SHELL ["/bin/bash", "--login", "-c"]
#
## test packages
#RUN python -c "from multiply_data_access import DataAccessComponent"
#RUN python -c "from vm_support.utils import create_config_file, set_permissions"
#RUN python -c "from vm_support.sym_linker import create_sym_links"
#RUN python -c "import glob"
#RUN python -c "import pyproj"

