FROM ubuntu:16.04
MAINTAINER Michael Vonbun <michael.vonbun@tum.de>

ARG DEBIAN_FRONTEND=noninteractive
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE                                          \
      org.label-schema.vcs-url="https://github.com/TUM-LIS/tum-dissertation-latex.git" \
      org.label-schema.vcs-ref=$VCS_REF                                                \
      org.label-schema.schema-version="1.1"

RUN set -x;                                         \
    { echo "# add texlive 2018 package repository"; \
      echo "deb http://ppa.launchpad.net/jonathonf/texlive-2018/ubuntu xenial main";     \
      echo "deb-src http://ppa.launchpad.net/jonathonf/texlive-2018/ubuntu xenial main"; \
    }  >> /etc/apt/source.list;                    \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4AB0F789CBA31744CC7DA76A8CF63AD3F06FC659; \
    apt-get update -q -y;                          \
    apt-get install -q -y --no-install-recommends  \
        build-essential                            \
        texlive                                    \
        texlive-generic-extra                      \
        texlive-lang-german                        \
        texlive-latex-extra                        \
        texlive-science                            \
        latexmk                                    \
        inkscape                                   \
        wget                                       \
        xzdec                                      \
        ;                                          \
    apt-get autoremove -q -y;                      \
    apt-get clean -q -y;                           \
    rm -rf /var/lib/apt/lists/*
