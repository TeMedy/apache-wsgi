# Apache with mod-wsgi in Python3 Container

> This project is for running a Python 3 web framework such as [Flask](http://flask.pocoo.org/) by integrating [mod_wsgi](https://github.com/GrahamDumpleton/mod_wsgi) and [Apache](https://httpd.apache.org/) server in a [Docker](https://www.docker.com/) container. 

## Motivation
Many of the docker repo's out there use flask local server in their images.
This repo is for a more production ready environment.

[This Flask app](http://code.tutsplus.com/tutorials/an-introduction-to-pythons-flask-framework--net-28822) is used for the purpose of demonstration for the repo

## How to Get Started
Here are the steps to get this container up and running and see the the web app in your browser. To be able to use this container, you need to have [Docker](https://docs.docker.com/engine/installation/) installed. 

First, clone this repo. 

Go to the folder where the `Dockerfile` is. 
Build the container by running the following docker build command (don't forget the `dot` at the end).

`docker build -t <a_name_for_docker_image> .` 

Use the following command to run the `Dockerfile` (Note that the `<a_name_for_docker_image>` is the same as what you used in the step before).

`docker run -d -p 80:80 --name <a_name_for_container> <a_name_for_docker_image>` 
 
 Go to your browser and enter address for your `localhost:80`. You should now be able to see the web page.

## Clean up

After running the docker build a couple of times, there will be images that occupies space on your hard drive. To Clean up those files, you need to run `docker rmi` and `docker volume rm`. To simpify the clean up process, I put all the clean up commands in the script `reset-docker`. This script stops all the containers. if you want more, you need to modify the script by uncommenting the lines that remove images and volumes. 


