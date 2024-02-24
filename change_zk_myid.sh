if [$# -eq 1]
then
    passwd=$1
else
    passwd=root
fi
o_data_home='/root/chainpaxos/zkOriginal/data'
n_data_home='/root/chainpaxos/apache-zookeeper-3.7.0-bin/data/'
i=1
for ip in $(< ./hosts)
do
    $(sshpass -p $passwd ssh "root@"$ip "cd $o_data_home && echo $i > myid && cp myid $n_data_home ")
    let i=i+1
done
