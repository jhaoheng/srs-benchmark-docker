#!/bin/sh


cmd=$1
if [[ "$cmd" == "start" ]]; then
	#statements
	echo "=== start processing ==="
elif [[ "$cmd" == "stop" ]]; then
	#statements
	echo "=== stop all processing ==="
	echo "..."
	killall sb_rtmp_publish
	echo ""
	return
else
	echo "error cmd : start , stop" 
	return
fi


# config
ossrs_endpoint="192.168.47.133"
max_publishers=2
film_resource="./video-resource/test.flv"


# start 
echo "-----"
echo "Start Time : "$(date +%T)
echo "ossrs : $ossrs"
echo "client counts : $max_publishers"
echo "Resource : $film_resource"
echo "-----"


for (( i = 0; i < $max_publishers; i++ )); do
	#statements
	echo "========> "$(date +%T) " : " $((i+1))
	pub="./objs/sb_rtmp_publish -i ./video-resource/test.flv -c 1 -r rtmp://$ossrs_endpoint/live/$i"
	echo $pub
	$pub &>/dev/null &
done
