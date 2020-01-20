FROM python:3.7

# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache -Iv jupyter==1.0.0 && \
    pip install --no-cache -Iv nbconvert==5.6.1 && \
    pip install --no-cache -Iv snakemake==5.9.1

RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.3/julia-1.3.1-linux-x86_64.tar.gz -O /home/rstudio/julia-1.3.1-linux-x86_64.tar.gz
RUN (cd /home/rstudio; tar -xvzf julia-1.3.1-linux-x86_64.tar.gz)
RUN ln -s /home/rstudio/julia-1.3.1/bin/julia /usr/bin/julia

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
