#!/bin/bash

cmd=$1
nodes=`./nodes.sh`

for node in $nodes
do
	#echo $node
        #sshpass -p root ssh -o "StrictHostKeyChecking no" $node "killall java" 2>&1 | sed "s/^/[$node] /"
	sshpass -p root ssh "root@$node" "pkill java"
done
echo done!
