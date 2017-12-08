FROM fedora:23

RUN dnf install -y tar bzip2

ENV URL=http://dl.4players.de/ts/releases/3.0.13.8/teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2

RUN curl -sL $URL -o /opt/ts3.tgz && \
    tar -vxf /opt/ts3.tgz -C /opt && \
    mv /opt/teamspeak3-server_linux_amd64/ /opt/ts3/

RUN useradd -r ts3 && \
    chown ts3: -R /opt/ts3/ && \
    mkdir -p  /var/lib/ts3/{logs,files}

RUN touch /opt/ts3/ts3server.sqlitedb && \
    chown ts3: -R /var/lib/ts3/ && \
    ln -sf /var/lib/ts3/logs /opt/ts3/logs && \
    ln -sf /var/lib/ts3/ts3server.sqlitedb /opt/ts3/ts3server.sqlitedb && \
    ln -sf /var/lib/ts3/files /opt/ts3/files

WORKDIR /opt/ts3/
ENV LD_LIBRARY_PATH /opt/ts3/
CMD /opt/ts3/ts3server
