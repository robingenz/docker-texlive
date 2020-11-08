FROM ubuntu:bionic

LABEL MAINTAINER="Robin Genz <mail@robingenz.dev>"

ENV PLANTUML_JAR /opt/plantuml.jar
ENV GRAPHVIZ_DOT /usr/sbin/dot

WORKDIR /tmp

COPY texlive.profile ./

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git curl wget \
    default-jre \
    graphviz \
    tex-common texinfo equivs perl-tk perl-doc freeglut3 \
    pandoc pandoc-citeproc \
    fig2dev \
    python3-pygments \
    # Install plantuml
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o $PLANTUML_JAR \
    # Install TeXLive
    && wget -O - -- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xzf - --strip-components=1 \
    && ./install-tl -no-gui -profile texlive.profile \
    # Clean up
    && rm -rf ./* \
    && apt-get clean -y

WORKDIR /workdir
