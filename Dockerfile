FROM node:12-stretch
MAINTAINER Adam K Dean <adamkdean@googlemail.com>

# Add git and expect
RUN apt update && apt -y install \
	git expect-dev

# Copy the login scripts
COPY bin/ /usr/local/bin

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

CMD ["bash", "/usr/local/bin/npm.sh"]
