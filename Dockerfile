FROM continuumio/miniconda3

COPY environment.yml .
RUN conda env update -f environment.yml

# test packages
RUN python -c "from multiply_data_access import DataAccessComponent"
RUN python -c "from vm_support.utils import create_config_file, set_permissions"
RUN python -c "from vm_support.sym_linker import create_sym_links"
RUN python -c "import datetime"
RUN python -c "import glob"


