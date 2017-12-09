FROM fedora:23

RUN dnf install -y tar bzip2 findutils

ENV URL=http://dl.4players.de/ts/releases/3.0.13.8/teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2
ENV TS_DIR="/opt/ts3"
ENV TS_SOURCE="/data"


RUN curl -sL $URL -o /opt/ts3.tgz && \
    tar -vxf /opt/ts3.tgz -C /opt && \
    mv /opt/teamspeak3-server_linux_amd64/ "${TS_DIR}"

RUN useradd -r ts3 && \
    chown ts3: -R "${TS_DIR}"

COPY data/ ${TS_SOURCE}

RUN for file in $(find ${TS_SOURCE} -mindepth 1 -maxdepth 1); do \
	ln -s "${file}" $(echo $file | sed 's@^'"${TS_SOURCE}"'@'"${TS_DIR}"'@g') \
; done

WORKDIR ${TS_DIR}
ENV LD_LIBRARY_PATH /opt/ts3/

COPY entrypoint.sh /entrypoint.sh
# ENTRYPOINT [ "/entrypoint.sh" ]

CMD /opt/ts3/ts3server
