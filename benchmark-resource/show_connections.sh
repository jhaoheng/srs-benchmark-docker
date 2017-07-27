#!/bin/bash

srs_connections=`netstat -anp|grep srs|grep ESTABLISHED|wc -l`;
nginx_connections=`netstat -anp|grep nginx|grep ESTABLISHED|wc -l`;
echo "srs_connections: $srs_connections";
echo "nginx_connections: $nginx_connections";