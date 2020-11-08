FROM ubuntu:bionic

LABEL MAINTAINER="Robin Genz <mail@robingenz.dev>"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git wget \
    texlive-full \
    pandoc pandoc-citeproc \
    fig2dev \
    python3-pygments \
    && apt-get clean -y

WORKDIR /workdir
