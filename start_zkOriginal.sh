if [ $# -eq 1 ]
then
    passwd=$1
else
    passwd="root"
fi
bin_dir='/root/chainpaxos/zkOriginal/bin'
conf_dir='/root/chainpaxos/zkOriginal/conf'
i=1
hosts_addr="$HOME/chainpaxos/hosts"
for ip in $(< $hosts_addr)
do
    sshpass -p root ssh "root@$ip" "rm -rf /tmp/zookeeper && mkdir /tmp/zookeeper && echo ${i} > /tmp/zookeeper/myid"
    let i=i+1
    j=1
    for snode in $(< $hosts_addr)
    do
        sshpass -p root ssh "root@$ip" "if ! grep server.${j} ${conf_dir}/zoo_sample.cfg;then echo server.${j}=${snode}:2888:3888 >> $conf_dir/zoo_sample.cfg;fi"
        j=$((j + 1))
    done
done
i=1
for ip in $(< $hosts_addr)
do
    sshpass -p $passwd ssh "root@$ip" "cd $bin_dir && ./zkServer.sh start ${conf_dir}/zoo_sample.cfg"
    let i=i+1
done
