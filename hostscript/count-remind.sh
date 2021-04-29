#!/bin/bash
container=$1
usermobile=$2
distlist=$3
limit=$4
count=`docker exec $container /bin/bash -c "cat ../../../root/.local/share/signal-cli/data/*" | jq '.recipientStore.recipientStore' | jq length`
docker exec $container /bin/bash -c "signal-cli -u $usermobile send -m '$usermobile count: $count' $distlist"
if [ $count -gt $limit ]
then
	docker stop $container
fi
