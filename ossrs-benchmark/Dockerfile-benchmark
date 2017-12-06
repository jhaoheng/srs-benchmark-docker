FROM		ubuntu:16.04

RUN			apt-get update
RUN 		apt-get install git unzip make gcc g++ -y

WORKDIR		/home

RUN 		git clone https://github.com/ossrs/srs-bench.git
RUN			cd srs-bench && \
			./configure && \
			make
