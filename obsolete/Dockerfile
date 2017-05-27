FROM andrewosh/binder-base

MAINTAINER Jeffrey Kantor <Kantor.1@nd.edu>

USER root

RUN apt-get update
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

USER main

# Install python libraries

RUN pip install seaborn
#RUN pip install --upgrade pandas-datareader
#RUN pip install ipywidgets
