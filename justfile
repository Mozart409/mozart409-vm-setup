default:
    just --choose

build os: clear 
    docker build --file Dockerfile.{{os}} --tag mozart409-vm-setup:{{os}} .

run os:
    docker run -it docker.io/library/mozart409-vm-setup:{{os}}

clear:
    clear

fmt:
    shfmt -l -w setup.sh
