FROM choiip/appinventor-server-env:latest

# appinventor-sources
RUN git clone --branch v181b --recursive https://github.com/mit-cml/appinventor-sources.git

RUN cd appinventor-sources/appinventor && ant MakeAuthKey && ant

CMD ./startserver.sh