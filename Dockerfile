FROM ubuntu:xenial

# install ViSP packages
RUN apt-get update
RUN apt-get install -y \
    libvisp-dev \
    visp-images-data \
    python-pip \
    && rm -rf /var/lib/apt/lists/

# install jupyter
RUN pip install --upgrade pip
RUN pip install jupyter matplotlib pillow

EXPOSE 8888
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}
WORKDIR ${HOME}

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser"]
