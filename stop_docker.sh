i=1
for ip in $(< ./hosts)
do
    node_name=chain''$i
    docker stop $node_name
    let i=i+1
done
