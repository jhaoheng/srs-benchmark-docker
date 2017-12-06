# ossrs

- 使用編譯好的 ossrs 當作 image base
- 設定檔 ./ossrs_benchmark/srs-conf/srs.conf
	- 在執行 docker 後，會自動掛載
- 查詢 srs log : `docker exec srs-benchmark-ossrs tail -f ./objs/srs.log`

# 查詢測試數據 : 
> 先進入 `docker exec -it ossrs /bin/bash`

- 查看系統資源
	```
	srs_pid=`ps aux|grep srs|grep conf|awk '{print $2}'`; 
	nginx_pid=`ps aux|grep nginx|grep worker|awk '{print $2}'`;
	top -p $load_pids$srs_pid,$nginx_pid 
	```
- 查看目前連接數
	```
	srs_connections=`netstat -anp|grep srs|grep ESTABLISHED|wc -l`;
	nginx_connections=`netstat -anp|grep nginx|grep ESTABLISHED|wc -l`;
	echo "srs_connections: $srs_connections";
	echo "nginx_connections: $nginx_connections"; 
	```
- 查看服務器頻寬，單位 bytes，x8 換算成 bits，更新時間 30 s
	```
	dstat -N lo 30
	```
