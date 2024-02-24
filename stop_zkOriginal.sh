if [ $# -eq 1 ]
then
    passwd=$1
else
    passwd="root"
fi
bin_dir='/root/chainpaxos/zkOriginal/bin'
conf_dir='/root/chainpaxos/zkOriginal/conf'
hosts_addr="$HOME/chainpaxos/hosts"
i=1
for ip in $(< "$hosts_addr")
do
    sshpass -p $passwd ssh "root@"$ip "cd $bin_dir && ./zkServer.sh stop $conf_dir/zoo_sample.cfg"
    let i=i+1
done
