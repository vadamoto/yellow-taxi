FROM vadamoto/binder-base

MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>

USER root

# Add dependency
#RUN apt-get update
#RUN apt-get install -y graphviz

USER main

# Install requirements for Python 2
RUN pip install bqplot
RUN jupyter nbextension enable --py bqplot

RUN conda install -c conda-forge ipyleaflet
RUN jupyter nbextension enable --py --sys-prefix ipyleaflet
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Install requirements for Python 3
#RUN /home/main/anaconda/envs/python3/bin/pip install -r requirements.txt
