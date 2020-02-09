FROM choiip/appinventor-server-env:latest

ARG REPO_TAG=master

# appinventor-sources
RUN git clone --branch ${REPO_TAG} --recursive https://github.com/mit-cml/appinventor-sources.git

RUN cd appinventor-sources/appinventor && ant MakeAuthKey && ant

CMD ./startserver.sh