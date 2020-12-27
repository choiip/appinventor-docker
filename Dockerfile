FROM openjdk:8

ENV HOME /home/developer

# Install other useful tools
RUN apt-get update && apt-get install -y \
    ant \
    curl \
    git \
    sudo \
    unzip \
# Install dependency
	lib32z1 \
	lib32stdc++6 \
# Install phantomJS
    phantomjs \
# Clean up
 && apt-get clean && apt-get purge \
# Set up some permissions. Replace 1000 with your user/groupid if it is different
 && export uid=1000 gid=1000 \
 && mkdir -p $HOME \
 && echo "developer:x:${uid}:${gid}:Developer,,,:${HOME}:/bin/bash" >> /etc/passwd \
 && echo "developer:x:${uid}:" >> /etc/group \
 && echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer \
 && chmod 0440 /etc/sudoers.d/developer \
 && chown ${uid}:${gid} -R $HOME \
# Google App engine
 && curl 'https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.84.zip' > /tmp/appengine.zip \
 && unzip -d $HOME /tmp/appengine.zip \
 && rm /tmp/appengine.zip \
 && ln -s $HOME/appengine-java-sdk-1.9.84 $HOME/appengine

COPY startserver.sh $HOME
RUN chmod +x $HOME/startserver.sh \
 && chown ${uid}:${gid} $HOME/startserver.sh

EXPOSE 8888

USER developer
WORKDIR $HOME
