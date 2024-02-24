nodes_name=()
i=1
for ip in $(< ./hosts)
do
    node_name=chain''$i
    docker start $node_name
    docker exec -it $node_name /etc/init.d/ssh restart
    let i=i+1
done
