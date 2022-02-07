FROM ubuntu:21.04

RUN apt-get update && apt-get install -y \
	ca-certificates \
	gcc \
	git \
	libncurses5 \
	libncurses5-dev \
	libncursesw5 \
	libncursesw5-dev \
	mdp \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV TERM	xterm-256color
ENV DEBUG	1

ENTRYPOINT ["mdp"]
