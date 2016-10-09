#!/usr/bin/docker build -f
# docker-steamcmd: A docker image useful for running steamcmd commands.
# Copyright (c) 2016 Aleksa Sarai
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# * The above copyright notice and this permission notice shall be included in
#   all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

FROM opensuse/amd64:42.1
MAINTAINER "Aleksa Sarai <cyphar@cyphar.com>"

# This all comes from https://developer.valvesoftware.com/wiki/SteamCMD#Linux.
# However, I've modified it to use openSUSE Leap to reduce the image size and
# also because I had issues with Debian that were solved by switching to
# openSUSE.
RUN zypper --no-gpg-checks ref && zypper in --no-confirm libgcc_s1-32bit libcurl4-32bit curl tar

# Download some proprietary garbage...
RUN mkdir -p /opt/steam && \
	curl -SL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' -o /tmp/steam.tar.gz && \
	tar zxvfC /tmp/steam.tar.gz /opt/steam && \
	rm -f /tmp/steam.tar.gz

# Run as non-root. Even inside a container, I don't trust steam.
RUN useradd -m -d/home/steam steam && chown -R steam /opt/steam

# /opt/data is what you should point force_install_dir to.
VOLUME ["/opt/data"]
ENTRYPOINT ["/opt/steam/steamcmd.sh"]
CMD []

# Switch to the non-root user.
USER steam
WORKDIR /home/steam
