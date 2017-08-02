FROM continuumio/anaconda3:latest

RUN conda update anaconda -y \
    && apt-get update \
    && apt-get install -y eatmydata \
    && eatmydata apt-get install -y \
    git \
    libfreetype6-dev \
    swig \
    mpich \
    pkg-config \
    && conda create -n py34 python=3.4 anaconda

RUN ["/bin/bash", "-c", "source activate py34 \
    && pip install git+https://github.com/IntelPNI/brainiak \
    nltools nilearn hypertools pymvpa2 mne deepdish nelpy dask pynv seaborn"]

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["source activate py34 && /bin/bash"]
