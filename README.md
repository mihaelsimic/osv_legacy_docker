# osv_legacy_docker
This repository provides a dockerfile which shows how to run Tricentis OSV legacy solution in a Docker container.
Providing this solution as the legacy product is still used very often by Tricentis customers and not officially deprecated.

## Download
Tricentis OSV download Link: https://support.tricentis.com/community/downloads.do \
Docker download link: https://docs.docker.com/desktop/

## Instructions
- Download the dockerfile and put it somewhere on your local drive.
- Build your first image by running following command: Docker build C:\OSV -t osv:latest \
C:\OSV is the base path to the dockerfile and -t is to provide name and tag for the image in the same name:tag format.
- Now run your docker image and map the ports between host and container:
 "docker run -v C:\OSV:C:\shareddata -v C:\OSV\Config:'C:\Program Files (x86)\Tricentis\Tosca OSV\Config' -p 10080:10080 -p 18080:18080 -p 54345:54345 -it osv" \
 "-v" tag is used to map a host volume to the container ensuring that the osv database and environments.xml is loaded and persisted. "-p" argument maps the ports used by osv between container and host and allows you to access the web ui & rest api via 18080 + perform virtualization scenarios on port 54345.

 ## Troubleshooting
 - At the end of the dockerfile we run the command 'cmd' to have a cmd session opened of the container. Type 'tasklist' to check if 'Tricentis.OSV.Host.exe' service is displayed.
 - If not, navigate to "C:\Program Files(x86)\TRICENTIS\Tosca OSV" and execute "Tricentis.OSV.Host.exe".
 - If you want to connect to the shell of an already running container use following command: "docker exec -it <container-name/ID> CMD"
