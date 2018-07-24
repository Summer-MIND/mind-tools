# mind-tools

This is a Docker container pre-built with **Python 3** tools you can use for data analysis and workshop demos during the [Methods in Neuroscience at Dartmouth](https://summer-mind.github.io/) summer school 2018.  

*Free free to contact Eshin (Slack: @ejolly) (email: eshin.jolly@gmail.com) regarding any issues you run into when setting up or using this container*

## One time setup
1. Install Docker on your computer using the appropriate guide below:
    - [OSX](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac)
    - [Windows](https://docs.docker.com/docker-for-windows/install/)
    - [Ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
    - [Debian](https://docs.docker.com/engine/installation/linux/docker-ce/debian/)
2. Launch Docker and adjust the preferences to allocate sufficient resources (e.g. > 4GB RAM)
3. Download the Docker image for MIND from docker hub (this download will take a while depending on the speed of your internet connection ~7GB):
    - Open a terminal and enter `docker pull ejolly/mind-tools`  
4. Use the downloaded image to create a new container for the workshop
    - The command below will create a new container that will map your computer's `Desktop` to `/mnt` within the container, so that location is shared between your host OS and the container. Feel free to change `Desktop` to whatever folder you prefer to share instead, but make sure to provide the full path. The command will also share port `9999` with your host computer so any jupyter notebooks launched from *within* the container will be accessible at `localhost:9999` in your web browser
    - `docker run -it -p 9999:9999 --name MIND -v ~/Desktop:/mnt ejolly/mind-tools `
    - You should now see the `root@` prefix in your terminal, if so you've successfully created a container and are running a shell from *inside*!

## Using the container after setup
1. You can always fire up the container by typing the following into a terminal
    - `docker start MIND && docker attach MIND`
    - You should not see the `root@` prefix, letting you know you're inside the container
2. You can easily open a new jupyter notebook session by typing the command `jp` from within the container. Just navigate to `localhost:9999` in your web-browser to access the notebook.
3. To switch from Python 3 to Python 2 (*not recommended unless absolutely necessary*) just type `source activate py27` from within the container and `source deactivate` to switch back.
4. Whatever folder on your host computer you shared with the container (e.g. `Desktop` in the above example) is located at `/mnt` within the container. You can interact with these files using normal unix commands (e.g. `cd`, `mv`, etc)
5. Open up a second terminal from within the running container with running the following command in another terminal window `docker exec -it MIND bash`
6. Close a running container with `ctrl + d` from the same terminal you used to launch the container, or `docker stop MIND` from any other terminal

## Installed Software

[Scientific python stack](https://www.scipy.org/about.html) ([Anaconda version](https://www.continuum.io/what-is-anaconda); e.g. numpy, pandas)   
[Brain Imaging Analysis Kit](http://brainiak.org/)  
[Neurolearn Toolbox](http://neurolearn.readthedocs.io/en/latest/)  
[PyMVPA](http://www.pymvpa.org/)  
[Hypertools](http://hypertools.readthedocs.io/en/latest/index.html)  
[MNE toolbox](https://martinos.org/mne/stable/index.html)  
[Deep dish](https://github.com/uchicago-cs/deepdish)  
[Nelpy](https://github.com/eackermann/nelpy)  
[Dask](https://dask.pydata.org/en/latest/)  
[Nilearn](http://nilearn.github.io/)  
