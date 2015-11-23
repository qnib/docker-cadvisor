FROM qnib/terminal:fd22

ENV GOPATH=/usr/local/
RUN dnf install -y make golang git-core && \
    go get github.com/tools/godep && \
    curl -fsL https://github.com/google/cadvisor/archive/master.zip | bsdtar xf - -C /opt/ && \
    mv /opt/cadvisor-master /opt/cadvisor 
RUN cd /opt/cadvisor && \
    go get -d && \
    make && \
    make install
