FROM adamkdean/baseimage
MAINTAINER Adam K Dean <adamkdean@googlemail.com>

# Add Git and Node package sources
RUN add-apt-repository -y ppa:git-core/ppa; \
    curl -sL https://deb.nodesource.com/setup | sudo bash -

# Install packages
RUN apt-get install -yq \
    git \
    expect-dev \
    nodejs

# Select specific version of Node.js via n
RUN npm install -g n; \
    n 0.12;

CMD ["bash"]
