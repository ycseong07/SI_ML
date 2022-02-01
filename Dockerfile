FROM jupyter/base-notebook

LABEL Yeonchan Seong  <ycseong07@gmail.com>

ENV LC_ALL=C.UTF-8

USER root

RUN apt-get update \
    && echo "Updated apt-get" \
    && apt-get install -y openjdk-8-jre \
    && echo "Installed openjdk 8"

RUN pip install --upgrade pip

RUN pip install pandas-datareader
RUN pip install numpy
RUN pip install pandas
RUN pip install matplotlib

# install scikit-learn with dependencies - modified from: https://hub.docker.com/r/mubo/sklearn/~/dockerfile/
RUN apt-get update && \
apt-get install -y pkg-config libopenblas-dev liblapack-dev build-essential gfortran python-dev libfreetype6-dev libjpeg-dev libhdf5-dev liblzo2-dev libbz2-dev && \
pip install cython && \
pip install numpy && \
pip install six && \
pip install scipy && \
pip install scikit-learn==0.22.1

USER $NB_UID

ENV JUPYTER_ENABLE_LAB=yes

