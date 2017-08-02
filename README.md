# mind-tools

This is a Docker container pre-built with python tools you can use for data analysis and workshop demos.

## Contains

[Scientific python stack](https://www.scipy.org/about.html) ([Anaconda version](https://www.continuum.io/what-is-anaconda); e.g. numpy, pandas)   
[Brain Imaging Analysis Toolkit](http://brainiak.org/)  
[Neurolearn Toolbox](http://neurolearn.readthedocs.io/en/latest/)  
[Pymvpa](http://www.pymvpa.org/)  
[Hypertools](http://hypertools.readthedocs.io/en/latest/index.html)  
[MNE toolbox](https://martinos.org/mne/stable/index.html)  
[Deep dish](https://github.com/uchicago-cs/deepdish)  
[Nelpy](https://github.com/eackermann/nelpy)  
[Dask](https://dask.pydata.org/en/latest/)  
[Nilearn](http://nilearn.github.io/)  



## Usage instructions  

1. Install the Docker daemon:
    - [OSX](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac)
    - [Windows](https://docs.docker.com/docker-for-windows/install/)
    - [Ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
    - [Debian](https://docs.docker.com/engine/installation/linux/docker-ce/debian/)
2. Launch the Docker daemon and adjust the preferences to allocate sufficient resources (e.g. > 4GB RAM)
3. Download the docker image from [docker hub](https://hub.docker.com/r/ejolly/mindtools/) and build it:
    - Open a terminal and enter:
    - `docker pull ejolly/mind-tools`
4. Create a new interactive container
    - `docker run -it -p 8888:8888 --name MIND ejolly/mindtools`
    - You should now see the `root@` prefix in your terminal, if so you're running a shell from *within* your the container!
5. Execute commands as desired:
    - Launch a jupyter notebook:
        - `jupyter notebook --port=8888 --no-browser --ip=0.0.0.0`
    - Open ipython from the command line
        - `ipython` at the command prompt
6. Close container with `ctrl + c`
7. Reopen container with (in a terminal on your own computer from any directory):
    - `docker start MIND`
    - `docker attach MIND`
    - (press enter)


## Helpful commands

- See what docker images you have downloaded and can be used to create new containers:  
	+ `docker images`  
- See running container dockers:  
	+ `docker ps`  
- See all docker containers you have created (including those not running):  
	+ `docker ps -a`
- Startup and connect to previously created container:
	+ `docker start yourContainerName`
	+ `docker attach yourContainerName`
- Delete a docker container:  
	+ `docker rm yourContainerName`  
- Delete a docker image:  
	+ `docker rmi yourImageName`  
- Stop a running container:  
	+ `docker stop yourContainerName`
- Execute a new command in an existing docker container
	+ `docker exec yourContainer command`
- Delete all containers that are no longer running:
	+ `docker rm $(docker ps -aq -f status=exited)`
- Force delete ALL containers
	+ `docker rm -f $(docker ps -aq)`

## Getting assistance

Free free to contact Eshin or Matteo regarding any issues you run into when setting up or using this container:

Eshin:  
@ejolly (Slack)  
eshin.jolly@gmail.com  

Matteo:  
@mvdoc (Slack)  
matteo.visconti@gmail.com
