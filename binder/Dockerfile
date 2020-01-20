FROM rocker/verse:3.6.2

# install the notebook package
RUN apt update
RUN apt-get -y install python3-pip
RUN python3 -m pip install -Iv jupyter==1.0.0
RUN python3 -m pip install -Iv nbconvert==5.6.1
RUN python3 -m pip install -Iv snakemake==5.9.1

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
--gecos "Default user" \
--uid ${NB_UID} \
${NB_USER}

WORKDIR ${HOME}

USER ${USER}
