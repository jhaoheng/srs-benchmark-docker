# Quick start

> Please make sure media-server instance and benchmark tool not run in the same instance.
> It could help you to more clear the stress info.

1. build ossrs in one instance
	- ref ossrs/readme.md
2. build ossrs-benchmark in another instance
	- ref ossrs-benchmark/readme.md


# netdata

- ossrs & benchmark include `netdata` application in docker-compose.yml. When build container success, you could use `http://{host}:19999` to monitor some data.