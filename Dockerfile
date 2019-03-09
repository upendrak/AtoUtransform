FROM rocker/r-base

RUN apt-get update 

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

RUN conda install -c iuc emboss

RUN Rscript -e 'install.packages("ape", dependencies=TRUE)'
RUN Rscript -e 'install.packages("getopt", dependencies=TRUE)'

COPY wrapper.r /usr/bin
RUN chmod +x /usr/bin/wrapper.r


ENTRYPOINT ["wrapper.r"]
CMD ["-h"]
