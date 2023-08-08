## Qiime2 GNPS - Metabolomics Notebooks

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Wang-Bioinformatics-Lab/Qiime2_Statistics_Notebook/HEAD?labpath=src%2Fgnps_qiime2.ipynb)


Here we are able to launch a notebook inside of docker with all the dependencies you would want. 

### Customizing Docker for Windows
```
1. Clone the repository - run "git clone https://github.com/Wang-Bioinformatics-Lab/Qiime2_Statistics_Notebook.git"
2. Update dependencies - change the requirements.txt
3. Open the repository in the command prompt - run "cd {insert repository location}"
4. Build the image - run in the command prompt "docker build -t {image name} ."
5. Run the container - run in the command prompt "docker run -d -p 8888:8888 {image name}"
6. Connect to the Jupyter Notebook at http://localhost:8888/, the default token is "password"
```

### Layout

All your code for notebooks will go in src. 

All the data you'll want to work with will go into data.

Additional documentation will go into docs. 

### Best Practices

Commit and save changes often and push to github. 

### Running this locally

You will need to install conda prior to this. 

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
