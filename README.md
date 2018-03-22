# ViSP
ViSP Docker Image

## Instructions

### Prerequisites
* [Install Docker](https://docs.docker.com/install/)
* Install X server (e.g. [XMing for Windows](http://www.straightrunning.com/XmingNotes/), XQuartz for macOS)

### Run the public image
* Execute: ``docker run -p 8888:8888 robinlab/visp:latest``
* Open in your browser the URL http://localhost:8888
* Note: If you are using Docker Toolbox on Windows 7, use the Docker Machine IP instead of ``localhost``. For example, http://192.168.99.100:8888. To find the IP address, use the command ``docker-machine ip``.

### Build a local image
* Clone this repository
* Open a terminal in the repository folder
* Execute: ``docker build -t visp .``

### Run the local image
* Make sure your X server is running without access restrictions
* Execute: ``docker run -p 8888:8888 -e DISPLAY=<host_IP_address>:0.0 visp``
* Open in your browser the URL shown in the docker terminal
