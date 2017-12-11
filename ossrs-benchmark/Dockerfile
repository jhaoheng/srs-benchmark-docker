FROM		ubuntu:16.04

RUN			apt-get update && \
	 		apt-get install git unzip make gcc g++ vim -y && \
	 		apt-get install psmisc


RUN 		cd /home && git clone https://github.com/ossrs/srs-bench.git
RUN			cd /home/srs-bench && \
			./configure && \
			make


WORKDIR		/home/srs-bench