# Build Quai in a stock Go builder container
FROM golang:1.20
RUN apt update && apt install -y \
    wget \
    git \
    git-lfs \
    golang-go \
    make
RUN git-lfs install
WORKDIR /
RUN git clone https://github.com/dominant-strategies/go-quai
WORKDIR /go-quai
RUN git pull && git fetch --all
RUN wget https://raw.githubusercontent.com/macochenjing/quai-network/main/network.env
RUN make go-quai

EXPOSE 8546 8547 30303 30303/udp
EXPOSE 8578 8579 30304 30304/udp
EXPOSE 8580 8581 30305 30305/udp
EXPOSE 8582 8583 30306 30306/udp
EXPOSE 8610 8611 30307 30307/udp
EXPOSE 8542 8643 30308 30308/udp
EXPOSE 8674 8675 30309 30309/udp
EXPOSE 8512 8613 30310 30310/udp
EXPOSE 8544 8645 30311 30311/udp
EXPOSE 8576 8677 30312 30312/udp
EXPOSE 8614 8615 30313 30313/udp
EXPOSE 8646 8647 30314 30314/udp
EXPOSE 8678 8679 30315 30315/udp


WORKDIR ./
