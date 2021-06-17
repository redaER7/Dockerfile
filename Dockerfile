FROM ubuntu:18.04

# install ubuntu packages
RUN sudo apt-get update -y \ 
&& sudo apt-get install -y sudo \ 
&& sudo apt-get install -y lsb-release \
&& sudo apt-get install -y wget \
&& sudo apt-get install -y unzip \
&& sudo apt-get install -y gnupg \
&& sudo apt-get install -y libfontconfig

# install python3
RUN sudo apt-get install python3.6

# install pip
RUN sudo apt install -y python3-pip

# install requirements
COPY requirements.txt /tmp/
RUN pip3 install --requirement /tmp/requirements.txt
COPY . /tmp/

# utf-8 encoding for python 
RUN export PYTHONIOENCODING=utf8

# create WORK DIRECTORY
RUN cd \
&& cd /home/ \
&& mkdir 00_WORK \
&& cd 00_WORK

