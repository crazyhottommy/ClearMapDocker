# See: http://phusion.github.io/baseimage-docker/
# baseimage is an docker friendly version of ubuntu
FROM phusion/baseimage:0.10.1

# Create a directory for working with ClearMap
RUN mkdir clearmap
# Set this as working directory
WORKDIR clearmap

# Install the neccessary Ubuntu packages 
RUN apt-get update
RUN apt-get install -y python2.7
RUN apt-get install -y python-pip
RUN apt-get install -y python-dev
RUN apt-get install -y build-essential
RUN apt-get install -y wget
RUN apt-get install -y bzip2
RUN apt-get install -y unzip
RUN apt-get install -y libgomp1

# Installing neccessary python packages
RUN pip install --upgrade pip
RUN pip install Cython
RUN pip install numpy


# Copy additional ClearMap resources.
# Included in the docker repo to combat any future 
# changes to the iDisco website.
RUN curl -O -J -L https://osf.io/c7qm6/download
RUN tar xvzf ClearMap_ressources.tar.gz
RUN rm ClearMap_ressources.tar.gz

# Programmatically set the version of Elastix to pull.
ENV ElastixVersion "4.9.0"

# Download a release of Elastix. 
# Development deemed stable (July, 2018).
RUN mkdir elastix
RUN cd elastix
RUN wget https://github.com/SuperElastix/elastix/releases/download/${ElastixVersion}/elastix-${ElastixVersion}-linux.tar.bz2
RUN tar xvjf elastix-4.9.0-linux.tar.bz2
RUN rm elastix-4.9.0-linux.tar.bz2

## Download ilastik
##d ownload Version 1.2.2 (based on Python 2) for ilastik
## https://www.ilastik.org/download.html
# it says in the settings.py from ClearMap, we need to download ilastik 0.5 from http://old.ilastik.org/index.php?cat=Download
## download ilastik
RUN cd /clearmap
RUN mkdir ilastik; cd ilastik
RUN wget http://files.ilastik.org/ilastik-1.2.2post2-Linux.tar.bz2
RUN tar xvjf ilastik-1.2.2post2-Linux.tar.bz2
RUN rm ilastik-1.2.2post2-Linux.tar.bz2

# Updating the bashrc
RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib" >> ~/.bashrc

# Install our custom ClearMap
RUN pip install https://github.com/LernerLab/ClearMap/zipball/master

