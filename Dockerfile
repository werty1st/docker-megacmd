FROM ubuntu:bionic

RUN apt-get update && apt-get install curl gnupg2 -y \
    && curl https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megacmd_1.2.0-10.1_amd64.deb --output /tmp/megacmd.deb \
    && apt install /tmp/megacmd.deb -y \
    && apt-get remove -y curl \
    && apt-get clean \
    && rm -rf /tmp/megacmd.deb

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

#ENTRYPOINT ["/bin/bash", "-c", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8080
VOLUME [ "/root/.megaCmd" ]
