FROM continuumio/miniconda3

COPY environment.yml .
RUN conda env update -f environment.yml


ENV PATH=/venv/bin:$PATH
RUN source /venv/bin/activate
RUN echo "source /venv/bin/activate" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

# test packages
RUN python -c "from multiply_data_access import DataAccessComponent"
RUN python -c "from vm_support.utils import create_config_file, set_permissions"
RUN python -c "from vm_support.sym_linker import create_sym_links"
RUN python -c "import datetime"
RUN python -c "import glob"


