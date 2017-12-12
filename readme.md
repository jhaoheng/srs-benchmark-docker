# Quick start

> Please make sure media-server instance and benchmark tool not run in the same instance.
> It could help you to more clear the stress info.
> 如果 benchmark instance 不夠力，容易掉線; 測試用的 benchmark instace 規格 => aws : t2.large

1. build ossrs in one instance
	- ref ossrs/readme.md
2. build ossrs-benchmark in another instance
	- ref ossrs-benchmark/readme.md

# netdata

- ossrs & benchmark include `netdata` application in docker-compose.yml. When build container success, you could use `http://{host}:19999` to monitor some data.


# how to use
1. 建立 ossrs / benchmark 的 instance
2. 如何驗證互相推送?
	1. 進入 ossrs 的 container，執行 `tail -f objs/srs.log`
	2. 進入 benchmark 的 container，執行 `./objs/sb_rtmp_publish -i ./video-resource/test.flv -c 1 -r rtmp://'{OSSRS_IP}'/live/livestream `
	3. 可看到流的狀態

## 環境處理好後，開始壓測，擷取數據

> 雖然各自的 readme 中有些數據偵測的方式，但目前我是用以下幾種方式，比較方便

1. 調整 benchmark.sh 的設定檔
2. 開啟 `/api/v1/vhosts/` 查看數量
3. 開啟 `/api/v1/summaries` 與 `{ip}:19999` 查看系統狀態
4. 開始推送 `. benchmark.sh start`
5. 測試 60 秒，穩定性，數量需維持一定
6. 關閉測試 `. benchmark.sh stop`
7. 確保 ossrs 的資源全部釋放，執行 `docker-compose restart`


# 壓測心得
1. 請勿用 micro 進行壓測