FROM ubuntu:xenial

ARG users=xrp_user

# Create ripple user
ENV HOME /ripple

RUN groupadd -g 1000 ripple \
    && useradd -u 1000 -g ripple -s /bin/bash -m -d ${HOME} ripple
