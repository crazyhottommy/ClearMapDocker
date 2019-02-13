# ClearMap Docker
Containerizes a Dulac Lab specific version of Christoph Kirst's ClearMap.

## Installation
Start by installing docker for your platform [here](https://store.docker.com/search?offering=community&type=edition).

Verify a successful installation with:
$`docker --version`


## Build
Navigate to this repository. 

$`docker build . -t clearmap`

## Run
$`docker run -it <BUILD HASH > bash`

## Test data

https://github.com/crazyhottommy/ClearMap_data
