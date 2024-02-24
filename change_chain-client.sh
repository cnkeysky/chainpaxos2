i=1
for ip in $(< ./hosts)
do
    node_name="chain"$i
    docker cp ./client/chain-client.jar $node_name:/root/chainpaxos/client/
    let i=i+1
done
