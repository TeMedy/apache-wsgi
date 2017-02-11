# Dockerized Mod_Wsgi with Apache

> This project is for running a Python 3 web framework (such as [Flask](http://flask.pocoo.org/)) by integrating [mod_wsgi](https://github.com/GrahamDumpleton/mod_wsgi) and [Apache](https://httpd.apache.org/) server in a [Docker](https://www.docker.com/) container. 

## Motivation
Many of the docker repo's out there use flask local server in their images. However, the Flask's built in server is not suitable for heavylifting. This repo runs the Flask framework on top the Appache server which is a more production ready environment. Also, a conventional way of integrating Appache and *mod_wsgi* is to install the *mod_wsgi* into the Appache by installing `libapache2-mod-wsgi` (or `libapache2-mod-wsgi-py3` for Python3) for instance in [here](https://github.com/Craicerjack/apache-flask.git). This approach has a major drawback as it is dependant on the distribution of the package with the operating system. For instance, at the time of this writing, in Debian, `libapache2-mod-wsgi-py3` is compiled for Python versions less than 3.4 while the latest Pyhotn version is 3.6. A much easier and more suitable way (and specially when dealing with Containers) is to install an official release of *mod_wsgi* **directly from the Python Package Index (PyPi)**. Doing so enables an easy way of running the server by using [mod_wsgi-express](http://blog.dscpl.com.au/2015/04/introducing-modwsgi-express.html). It supports easy server start and auto reload when there is a code change and takes away the headache of Apache configuration by providing a ready-to-go configuration file. 

[This Flask app](http://code.tutsplus.com/tutorials/an-introduction-to-pythons-flask-framework--net-28822) is used for the purpose of demonstration for the repo

## How to Get Started
Here are the steps to get this container up and running and see the the web app in your browser. To be able to use this container, you need to have [Docker](https://docs.docker.com/engine/installation/) installed. 

First, clone this repo. 

### Option 1: Primitive Docker
Go to the folder where the `Dockerfile` is. 
Build the container by running the following docker build command (don't forget the `dot` at the end).

`docker build -t <a_name_for_docker_image> .` 

Use the following command to run the `Dockerfile` (Note that the `<a_name_for_docker_image>` is the same as what you used in the step before).

`docker run -d -p 80:5000 --name <a_name_for_container> <a_name_for_docker_image>` 
 
Go to your browser and enter address for your `localhost:80`. You should now be able to see the web page.

### Option 2: Docker-Compose

Instead of running multiple commands with numerous input arguments, the more recent [*docke-compose*](https://docs.docker.com/compose/overview/) tool can be used to automate everything. Well, it is not a perfect world though since *docker-compose* tend to exhibit some unstable behaviour, and you'll need to clean up from time to time. To use *docker-compose* run this command on the same folder as `docker-compose.yml`

`docker-compose up`

A very handy advantage of the second option here is the use of *volumes* (although you could have them in the first option too with some additional input args). In here, the web_engine folder on the host machine (e.g., my Mac SSD drive) is mapped to the folder */var/www/your-application/web_engine* in the container. And here is the beauty of this approach: if I edit the code on my machine using an editor of choice, those changes will be reflected inside the container, and therefore, I can instantly see the results in the web browser. I will not need to rebuild the container and restart things (Remember the `--reload-on-changes` flag was used for `mod_wsgi-espress` in `Dockerfile`). 

## Clean up

After running the docker build a couple of times, there will be images that occupies space on your hard drive. To Clean up those files, you need to run `docker rmi` and `docker volume rm`. To simpify the clean up process, I put all the clean up commands in the script `cleanup-docker`. This script stops all the containers. if you want more, you need to modify the script by uncommenting the lines that remove images and volumes. Although Docker tends to gubble up the hard drive on Mac. See [here](https://github.com/docker/for-mac/issues/371) for some discussion and drastic solutions.


