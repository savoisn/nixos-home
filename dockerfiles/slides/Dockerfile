# run it like that !
# docker run -it -v /etc/localtime:/etc/localtime:ro \
#                -v /etc/machine-id:/etc/machine-id:ro \
#                -v "${PWD}":/data \
#                -v /etc/passwd:/etc/passwd \
#                -e "HOME" \
#                -e COLUMNS="`tput cols`" \
#                -e LINES="`tput lines`" \
#                -u $(id -u):$(id -g) \
#                nsa/slides:latest /data/examples/preprocess.md

: '
 your comments here
'

FROM ubuntu:21.04

RUN apt-get update && apt-get install -y \
	ca-certificates \
	gcc \
	curl \
	libncurses5 \
	libncurses5-dev \
	libncursesw5 \
	libncursesw5-dev \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/maaslalani/slides/releases/download/v0.7.2/slides_0.7.2_linux_amd64.tar.gz -o /slides.tar.gz && \
    tar xzf /slides.tar.gz

ENV TERM	xterm-256color
ENV DEBUG	1

ENTRYPOINT ["/slides"]
