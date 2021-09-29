FROM gpuci/miniconda-cuda:11.1-runtime-ubuntu20.04
WORKDIR /
COPY environment.yml .
RUN apt update && apt install -y --no-install-recommends \
    git \
    ssh-client \
    build-essential \
    python3-dev \
    python3-pip \
    python3-setuptools \
    curl && \
    conda update -y conda && \
    conda env create -n notebookenv -f environment.yml
    
SHELL ["conda", "run", "--no-capture-output", "-n", "notebookenv", "/bin/bash", "-c"]
    
ENV NB_PREFIX /

ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "notebookenv"]