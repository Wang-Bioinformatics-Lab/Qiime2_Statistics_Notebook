FROM continuumio/miniconda3:4.10.3

# Installing Mamba
RUN conda install -c conda-forge mamba

# Installing Qiime2
RUN wget https://data.qiime2.org/distro/core/qiime2-2023.2-py38-linux-conda.yml
RUN mamba env create -n qiime2 --file qiime2-2023.2-py38-linux-conda.yml

COPY requirements.txt /
RUN /bin/bash -c ". activate qiime2 && pip install -r /requirements.txt"

# Installing GNPS Data Package
RUN /bin/bash -c ". activate qiime2 && pip install git+https://github.com/Wang-Bioinformatics-Lab/GNPSDataPackage.git@2035cd2aa27dd29e311c7a9e171abf7f2207789a"

RUN /bin/bash -c ". activate qiime2 && jupyter serverextension enable --py qiime2 --sys-prefix"

## Setting up the proper permissions
ARG NB_USER=jovyan
ARG NB_UID=1000
RUN useradd -u ${NB_UID} -s /bin/bash -m ${NB_USER}

ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# # Make sure the contents of our repo are in ${HOME}
COPY . /home/${NB_USER}/
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

#CMD conda activate qiime2 && jupyter lab