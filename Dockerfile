FROM docker.io/debian:bookworm-slim as builder
COPY . /src
WORKDIR /src
RUN apt-get update && apt-get install -y g++ make cmake
RUN cmake -D CMAKE_BUILD_TYPE=Release -B build -S .
RUN make -C build

FROM docker.io/debian:bookworm-slim
LABEL name="mcproxy" maintainer="Yuxiang Zhu <vfreex@gmail.com>"
RUN mkdir -p /etc/mcproxy
COPY --from=builder /src/build/mcproxy-bin /usr/local/bin/mcproxy
CMD ["/usr/local/bin/mcproxy", "-s", "-f", "/etc/mcproxy/mcproxy.conf"]
