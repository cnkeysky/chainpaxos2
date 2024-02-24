echo 'start_zkOriginal.sh'
./exec_lat_split.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3,5,7 --reads_per 0 \
    --algs epaxos,esolatedpaxos --n_threads 14
if [ $? -ne 0 ]
then
    echo '第一个指令错误'
    exit 1
fi
./exec_lat_leader.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3,5,7 --reads_per 0 \
    --algs distinguished,multi --n_threads 14
if [ $? -ne 0 ]
then
    echo '第二个指令错误'
    exit 1
fi
./exec_lat_tail.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3,5,7 --reads_per 0 --zoo_url localhost \
    --algs uring,chainrep --n_threads 14
if [ $? -ne 0 ]
then
    echo '第三个指令错误'
    exit 1
fi
./exec_lat_middle.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3,5,7 --reads_per 0 \
    --algs chain_mixed --n_threads 14
if [ $? -ne 0 ]
then
    echo '第四个指令错误'
    exit 1
fi
./exec_lat_leader.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3 --ring_insts 120 --reads_per 0 \
    --algs ring --n_threads 14
if [ $? -ne 0 ]
then
    echo '第五个指令错误'
    exit 1
fi
./exec_lat_leader.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 5 --ring_insts 200 --reads_per 0 \
    --algs ring --n_threads 14
if [ $? -ne 0 ]
then
    echo '第六个指令错误'
    exit 1
fi
./exec_lat_leader.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 7 --ring_insts 250 --reads_per 0 \
    --algs ring --n_threads 14
if [ $? -ne 0 ]
then
    echo '第七个指令错误'
    exit 1
fi
./killall.sh
echo 'done'
