## Qiime2 GNPS - Metabolomics Notebooks

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Wang-Bioinformatics-Lab/Qiime2_Statistics_Notebook/HEAD?labpath=src%2Fgnps_qiime2.ipynb)


Here we are able to launch a notebook inside of docker with all the dependencies you would want. 

### Customizing Docker for you

1. Update dependencies - change the requirements.txt
1. Update your password - create an .env file with LOGINPASSWORD=YOUR_PASSWORD or else it will not be available
1. Update the port for the server - change port 9000 to something around 9000, but not 9000 in docker-compose.yml or docker-compose-coder.yml
1. Change the name of the container - change wanglab-jupyter in docker-compose.yml or docker-compose-coder.yml

### Launching the Jupyter Notebook

make jupyter-compose

You can then access it via http://localhost:9574

### Layout

All your code for notebooks will go in src. 

All the data you'll want to work with will go into data.

Additional documentation will go into docs. 

### Best Practices

Commit and save changes often and push to github. 

### Running this locally

```
# Installing Mamba
conda install -c conda-forge mamba

wget https://data.qiime2.org/distro/core/qiime2-2023.2-py38-linux-conda.yml
mamba env create -n qiime2 --file qiime2-2023.2-py38-linux-conda.yml

conda activate qiime2
pip install -r requirements.txt

# Installing GNPS Data Package
pip install git+https://github.com/Wang-Bioinformatics-Lab/GNPSDataPackage.git@2035cd2aa27dd29e311c7a9e171abf7f2207789a

# Prepping the notebooks
jupyter serverextension enable --py qiime2 --sys-prefix

jupyter lab
```
