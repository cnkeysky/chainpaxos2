container_log_home="/root/chainpaxos/logs/"
target_log_home="$HOME/chainpaxos/"
i=1
for ip in $(< ./hosts)
do
    node_name="chain"$i
    $(docker cp ${node_name}:${container_log_home} ${target_log_home})
    let i=i+1
done
