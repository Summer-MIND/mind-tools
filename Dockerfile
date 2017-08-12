FROM debian:latest

# Install necessary linux packages from apt-get
RUN apt-get update --fix-missing && apt-get install -y eatmydata

RUN eatmydata apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git \
    libfreetype6-dev \
    swig \
    mpich \
    pkg-config \
    gcc \
    wget \
    curl \
    vim \
    nano \
    libgl1-mesa-glx \
    ffmpeg

# Install anaconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

# Setup anaconda path
ENV PATH /opt/conda/bin:$PATH

# Install gcc to make it work with brainiak
RUN ["/bin/bash", "-c", "conda install -y gcc"]

# Install packages needed
RUN pip install git+https://github.com/IntelPNI/brainiak \
    nltools \
    nilearn \
    hypertools \
    pymvpa2 \
    mne \
    deepdish \
    nelpy \
    dask \
    pynv \
    seaborn

RUN conda create -n py27 python=2.7
RUN ["/bin/bash", "-c", "source activate py27 && \
    conda install -y numpy \
    scipy \
    pandas \
    cython \
    joblib \
    memory_profiler \
    numexpr \
    psutil \
    scikit-learn \
    ipython \
    matplotlib \
    jupyter \
    seaborn && \ 
    pip install git+git://github.com/bnpy/bnpy.git \
    munkres"]

# What should run when the container is launched
ENTRYPOINT ["/bin/bash"]
