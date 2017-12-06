# Quick start

1. `docker-compose up -d`
2. 開新 terminal, 查看 srs-log : `docker exec srs-benchmark-ossrs tail -f ./objs/srs.log`
3. 執行 benchmark : (example) 
	- `docker exec srs-benchmark-tool ./srs-bench/objs/sb_rtmp_load -c 1 -r rtmp://srs-benchmark-ossrs:1935/live/livestream`
	- 相關參數請參考下面使用方式


