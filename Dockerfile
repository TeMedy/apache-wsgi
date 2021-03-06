############################################################
# Dockerfile to build Flask App
############################################################

# Set the base image
#      https://hub.docker.com/_/python/
FROM python:3.6

# File Author / Maintainer
MAINTAINER Hossein Medy (hossein.medy@gmail.com)

# Install Apache and some other handy packages 
RUN apt-get update && apt-get install -y \ 
    apache2 \
    apache2-dev \  
    vim less\
 && apt-get clean \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/*

# Install [mod_wsgi] (https://github.com/GrahamDumpleton/mod_wsgi) 
RUN pip install mod_wsgi

# Copy the web application code, and install the application requirements 
ADD ./web_engine /var/www/your-application/web_engine
RUN pip install -r /var/www/your-application/web_engine/requirements.txt

# Copy over the wsgi file 
COPY ./wsgi.py /var/www/your-application/wsgi.py

EXPOSE 5000

WORKDIR /var/www/your-application/

# Run mode_wsgi with a non-root user and auto reload (https://github.com/GrahamDumpleton/mod_wsgi) 
CMD mod_wsgi-express start-server wsgi.py --port=5000 --user www-data --group www-data --reload-on-changes
#CMD /bin/bash

