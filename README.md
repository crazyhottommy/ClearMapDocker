# ClearMap Docker
Containerizes a Dulac Lab specific version of Christoph Kirst's ClearMap.

## Installation
Start by installing docker for your platform [here](https://store.docker.com/search?offering=community&type=edition).

Verify a successful installation with:
$`docker --version`


## Build
Navigate to this repository. 

$`docker build . -t clearmap`
$`docker login`

## Run
$`docker run -it <BUILD HASH > bash`

follow https://docs.docker.com/v17.12/docker-cloud/builds/push-images/ to push to dockerhub

```bash
export DOCKER_ID_USER="crazyhottommy"
docker login
docker tag clearmap crazyhottommy/clearmap
docker push crazyhottommy/clearmap
```

###  on HPC
follow instructions https://www.rc.fas.harvard.edu/resources/documentation/software/singularity-on-odyssey/
```bash
ssh bio1
mkdir clearmap_singularity; cd !$
singularity pull docker://crazyhottommy/clearmap
singularity shell clearmap.simg
```
## Test data

https://github.com/crazyhottommy/ClearMap_data
