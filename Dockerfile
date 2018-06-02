FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y git sudo lsb-release && \
    adduser --disabled-password --gecos '' docker && \
    adduser docker sudo && \ 
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

RUN cd ~ && \
    git clone https://github.com/diydrones/ardupilot.git 

RUN cd ~/ardupilot && \
    echo "y" | sudo ./Tools/scripts/install-prereqs-ubuntu.sh && \
    sudo git checkout Copter-3.5.5 && \ 
    sudo git submodule update --init --recursive && \ 
    sudo ./waf configure --board=bbbmini && \
    sudo ./waf && \
    sudo ./waf examples 

RUN sudo mkdir -p /output
CMD sh -c "sudo cp -R ~/ardupilot/build/bbbmini/bin/* /output/ && mkdir -p /output/examples && sudo cp -R ~/ardupilot/build/bbbmini/examples/* /output/examples"