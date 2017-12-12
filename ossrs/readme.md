# ossrs build
1. create instance
2. docker/docker-compose install
3. `docker login quay.io`
4. `docker-compose up -d`
5. check log : `docker exec srs-benchmark-ossrs tail -f ./objs/srs.log`
6. check receiver(use ffmpeg)
	1. publish : `ffmpeg -re -stream_loop -1 -i {your_video} -vcodec libx264 -acodec aac -f flv "rtmp://{ossrs_host}/demo/video"`
	2. check log, could see the streaming input.


# 查詢壓力資訊
1. 透過 netdata : `http://{ip}:19999`
2. 透過 ossrs api


# ossrs api
> ref : https://github.com/ossrs/srs/wiki/v2_CN_HTTPApi#server-id
> 在 browser 中，安裝 chrome plugin : json formatter

- 透過 browser 查詢 client 連線資料 : `http://{ip}:1985/api/v1/clients/`
- streams : `http://{ip}:1985/api/v1/streams/`
	- 這個是累加的數據，若要監控此數據，每次 benchmark 推完，都要透過 `docker-compose restart` 進行重起的動作
- 查看所有 vhost 的連接狀態 : `http://{ip}:1985/api/v1/vhosts/` , 以下範例為壓力測試 700 用戶數
```
{
	"code": 0,
	"server": 1,
	"vhosts": [
		{
			"id": 2,
			"name": "__defaultVhost__",
			"enabled": true,
			"clients": 700,
			"streams": 700,
			"send_bytes": 2931600,
			"recv_bytes": 268977617,
			"kbps": {
				"recv_30s": 0,
				"send_30s": 0
			},
			"hls": {
				"enabled": false
			}
		}
	]
}
```
- 查看系統總結 : `/api/v1/summaries`

# other : 查詢測試數據 : 
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