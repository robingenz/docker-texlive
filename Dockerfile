FROM ubuntu:bionic

LABEL MAINTAINER="Robin Genz <mail@robingenz.dev>"

ENV PLANTUML_JAR /opt/plantuml.jar
ENV GRAPHVIZ_DOT /usr/sbin/dot

WORKDIR /tmp

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git wget \
    default-jre \
    graphviz \
    tex-common texinfo equivs perl-tk perl-doc freeglut3 \
    pandoc pandoc-citeproc \
    fig2dev \
    python3-pygments \
    # Install plantuml
    && wget https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -O $PLANTUML_JAR \
    # Clean up
    && rm -rf ./* \
    && apt-get clean -y

WORKDIR /workdir
