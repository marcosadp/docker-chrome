FROM ubuntu:17.04

MAINTAINER Marcos Di Pietro <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

COPY AptSources /etc/apt/sources.list.d/

RUN useradd -m google-chrome
RUN apt-get update
RUN apt-get install -y wget
RUN wget --no-check-certificate -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates \
                                                  gconf-service \
                                                  hicolor-icon-theme \
                                                  libappindicator1 \
                                                  libasound2 \
                                                  libcurl3 \
                                                  libexif-dev \
                                                  libgconf-2-4 \
                                                  libgl1-mesa-dri \
                                                  libgl1-mesa-glx \
                                                  libnspr4 \
                                                  libnss3 \
                                                  libpango1.0-0 \
                                                  libv4l-0 \
                                                  libxss1 \
                                                  libxtst6 \
                                                  xdg-utils \
                                                  google-chrome-stable
RUN rm -rf /var/lib/apt/lists/*

COPY start-google-chrome.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/start-google-chrome.sh"]
