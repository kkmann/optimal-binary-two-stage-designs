FROM rocker/verse:3.6.2

# install the notebook package
RUN apt-get -y install python3-pip
RUN pip install --no-cache --upgrade pip && \
pip install --no-cache notebook

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
