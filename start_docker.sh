network_name=chain-net
if ! docker network ls | awk '{print $2}' | grep -q "^${network_name}$" 
then
    ./create_docker_network.sh
fi
i=1
nodes_name=()
ssh_dir="$HOME/.ssh"
file_path="$HOME/.ssh/known_hosts"
if [ ! -d "$ssh_dir" ]
then
    mkdir -p "$ssh_dir"
fi

if ! grep "StrictHostKeyChecking=no" /etc/ssh/ssh_config
then
    echo "StrictHostKeyChecking=no" >> /etc/ssh/ssh_config
fi

for ip in $(< ./hosts)
do
    node_name=chain''$i
    nodes_name[$i-1]=$node_name
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "$ip"
    ssh-keyscan -H  $ip >> $file_path
    docker run -dit --privileged=true --name $node_name  --hostname $node_name --ip $ip --network ${network_name} chain-paxos 
    let i=i+1
done

for v in ${nodes_name[@]}
do
    docker exec -it $v /etc/init.d/ssh restart
done
