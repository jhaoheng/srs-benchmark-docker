#!/bin/bash

srs_pid=`ps aux|grep srs|grep conf|awk '{print $2}'`;
nginx_pid=`ps aux|grep nginx|grep worker|awk '{print $2}'`;
load_pids=`ps aux|grep objs|grep sb_rtmp_load|awk '{ORS=",";print $2}'`;
top -p $load_pids$srs_pid,$nginx_pid 