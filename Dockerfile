FROM continuumio/miniconda3
RUN conda install -c mamba conda-forge conda-merge conda-pack
COPY environment.yml .
RUN conda env update -f environment.yml
RUN conda list
SHELL ["conda", "run", "-n", "venv", "/bin/bash", "-c"]
#RUN pip uninstall -y typing-inspect marshmallow
#RUN conda install -n venv typing_inspect requests marshmallow
RUN conda list
# test packages
RUN python -c "from multiply_data_access import DataAccessComponent"
RUN python -c "from vm_support.utils import create_config_file, set_permissions"
RUN python -c "from vm_support.sym_linker import create_sym_links"
RUN python -c "import glob"
