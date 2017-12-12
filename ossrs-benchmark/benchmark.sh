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
ossrs_endpoint="54.183.109.138"
max_publishers=500
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
	user=$((i+1))
	echo "========> "$(date +%T) " : " $user
	pub="./objs/sb_rtmp_publish -i ./video-resource/test.flv -c 1 -r rtmp://$ossrs_endpoint/live/$user"
	echo $pub
	$pub &>/dev/null &
done
