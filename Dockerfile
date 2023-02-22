from jupyter/datascience-notebook:lab-3.4.4

COPY requirements.txt /
RUN pip install -r /requirements.txt
RUN pip install jupyterlab-git

# Installing Mamba
RUN conda install -c conda-forge mamba

# Installing Qiime2
RUN wget https://data.qiime2.org/distro/core/qiime2-2019.4-py36-linux-conda.yml
RUN mamba env create -n qiime2-2019.4 --file qiime2-2019.4-py36-linux-conda.yml

# Installing GNPS Data Package
RUN pip install git+https://github.com/Wang-Bioinformatics-Lab/GNPSDataPackage.git@2035cd2aa27dd29e311c7a9e171abf7f2207789a
