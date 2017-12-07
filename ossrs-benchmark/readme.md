
# srs-benchmark-tool

- you can use:
	- `./objs/sb_http_load`
    - `./objs/sb_hls_load`
    - `./objs/sb_rtmp_load`
    - `./objs/sb_rtmp_load_fast`
    - `./objs/sb_rtmp_publish`
- 詳細請搜尋 sb_rtmp_publish or sb_rtmp_load

# how

## build container
1. build tool
	- `docker build -t tool .`
2. build netdata to monitor info
	- `docker-compose up -d`

## run bench-mark

1. `docker run -it -v $(pwd)/video-resource:/home/srs-bench/video-resource tool /bin/bash`
2. `./objs/sb_rtmp_publish -i ./video-resource/test.flv -c 1 -r rtmp://54.183.109.138:1935/live/livestream`
	- `-c` : clients
	- `-r` : url

# benchmark ref
## sb_rtmp_publish

```
SB(SRS Bench) RtmpPublishLoad/1.0.14, Copyright (c) 2013-2015 winlin
srs.librtmp 3.0.18 (https://github.com/winlinvip/srs.librtmp)

Usage: ./sb_rtmp_publish <Options> <-u URL>
./sb_rtmp_publish base on st(state-threads), support huge concurrency.
Options:
  -c CLIENTS, --clients CLIENTS    The concurrency client to start to request. defaut: 1
  -r URL, --url URL                The load test url for each client to download/process. 
  -t REPEAT, --repeat REPEAT       The repeat is the number for each client to download the url. 
                                   ie. rtmp://127.0.0.1:1935/live/livestream_{i}
                                   default: 0. 0 means infinity.
  -s STARTUP, --start STARTUP      The start is the ramdom sleep when  thread startup in seconds. 
                                   defaut: 5.00. 0 means no delay.
  -d DELAY, --delay DELAY          The delay is the ramdom sleep when success in seconds. 
                                   default: 1.00. 0 means no delay. -1 means to use HLS EXTINF duration(HLS only).
  -e ERROR, --error ERROR          The error is the sleep when error in seconds. 
                                   defaut: 3.00. 0 means no delay. 
  -m SUMMARY, --summary SUMMARY    The summary is the sleep when report in seconds. 
                                   etasks is error_tasks, statks is sub_tasks, estatks is error_sub_tasks.
                                   duration is the running time in seconds, tduration is the avarage duation of tasks.
                                   nread/nwrite in Mbps, duration/tduration in seconds.
                                   defaut: 30.00. 0 means no delay. 
  -v, --version                    Print the version and exit.
  -h, --help                       Print this help message and exit.

Examples:
1. start a client
   ./sb_rtmp_publish -i doc/source.200kbps.768x320.flv -c 1 -r rtmp://127.0.0.1:1935/live/livestream
2. start 1000 clients
   ./sb_rtmp_publish -i doc/source.200kbps.768x320.flv -c 1000 -r rtmp://127.0.0.1:1935/live/livestream_{i}
3. start 10000 clients
   ./sb_rtmp_publish -i doc/source.200kbps.768x320.flv -c 10000 -r rtmp://127.0.0.1:1935/live/livestream_{i}
4. start 100000 clients
   ./sb_rtmp_publish -i doc/source.200kbps.768x320.flv -c 100000 -r rtmp://127.0.0.1:1935/live/livestream_{i}

This program built for linux.
Report bugs to <winlin@vip.126.com>
```


## sb_rtmp_load

```
[2017-12-06 06:22:58.856][0][trace] params url=, threads=1, start=5.00, delay=1.00, error=3.00, report=30.00, count=0
SB(SRS Bench) RtmpPlayLoad/1.0.14, Copyright (c) 2013-2015 winlin
srs.librtmp 3.0.18 (https://github.com/winlinvip/srs.librtmp)

Usage: ./sb_rtmp_load <Options> <-u URL>
./sb_rtmp_load base on st(state-threads), support huge concurrency.
Options:
  -c CLIENTS, --clients CLIENTS    The concurrency client to start to request. defaut: 1
  -r URL, --url URL                The load test url for each client to download/process. 
  -t REPEAT, --repeat REPEAT       The repeat is the number for each client to download the url. 
                                   ie. rtmp://127.0.0.1:1935/live/livestream
                                   default: 0. 0 means infinity.
  -s STARTUP, --start STARTUP      The start is the ramdom sleep when  thread startup in seconds. 
                                   defaut: 5.00. 0 means no delay.
  -d DELAY, --delay DELAY          The delay is the ramdom sleep when success in seconds. 
                                   default: 1.00. 0 means no delay. -1 means to use HLS EXTINF duration(HLS only).
  -e ERROR, --error ERROR          The error is the sleep when error in seconds. 
                                   defaut: 3.00. 0 means no delay. 
  -m SUMMARY, --summary SUMMARY    The summary is the sleep when report in seconds. 
                                   etasks is error_tasks, statks is sub_tasks, estatks is error_sub_tasks.
                                   duration is the running time in seconds, tduration is the avarage duation of tasks.
                                   nread/nwrite in Mbps, duration/tduration in seconds.
                                   defaut: 30.00. 0 means no delay. 
  -v, --version                    Print the version and exit.
  -h, --help                       Print this help message and exit.

Examples:
1. start a client
   ./sb_rtmp_load -c 1 -r rtmp://127.0.0.1:1935/live/livestream
2. start 1000 clients
   ./sb_rtmp_load -c 1000 -r rtmp://127.0.0.1:1935/live/livestream
3. start 10000 clients
   ./sb_rtmp_load -c 10000 -r rtmp://127.0.0.1:1935/live/livestream
4. start 100000 clients
   ./sb_rtmp_load -c 100000 -r rtmp://127.0.0.1:1935/live/livestream

This program built for linux.
Report bugs to <winlin@vip.126.com>
```