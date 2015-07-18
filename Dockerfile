FROM niaquinto/lua:5.2
MAINTAINER Nicholas Iaquinto <nickiaq@gmail.com>

ENV LUAROCKS_HASH 5a830953d27715cc955119609f8096e6
ENV LUAROCKS_VERSION 2.2.2
ENV PATH $PATH:/usr/local/luarocks/src/bin
ENV LUA_PATH /usr/local/luarocks/src/?.lua;;
ENV LUA_CPATH /usr/local/luarocks/src/?.so;
RUN echo "${LUAROCKS_HASH} luarocks-${LUAROCKS_VERSION}.tar.gz" > luarocks-${LUAROCKS_VERSION}.md5 && \
    wget http://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz && \
    md5sum -c luarocks-${LUAROCKS_VERSION}.md5 && \
    tar -xzvf luarocks-${LUAROCKS_VERSION}.tar.gz && \
    cd luarocks-${LUAROCKS_VERSION} && \
    ./configure --lua-version=${LUA_MAJOR_VERSION} && \
    make && make install && \
    cd .. && rm -rf *.tar.gz *.md5 luarocks-${LUAROCKS_VERSION}
