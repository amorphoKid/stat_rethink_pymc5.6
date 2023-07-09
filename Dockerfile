FROM ubuntu 

# Install base utilities
RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH
#SHELL ["conda", "run", "-n", "myenv", "/bin/bash", "-c"]
RUN conda install -n base --override-channels -c conda-forge mamba 'python_abi=*=*cp*'
RUN mamba create -n pymc_env jupyterlab "pymc>=5"  -c conda-forge -y

#RUN conda create -c conda-forge -n pymc_env "pymc>=5"\
#    conda activate pymc_env\
#    conda install numpyro\
#    conda install -c anaconda jupyter pandas seaborn 