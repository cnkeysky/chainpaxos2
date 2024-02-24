echo 'start_zkOriginal'
./exec_cpu_threads.sh  --exp_name test --n_clients 3 --n_runs 3 --payloads 128 \
    --n_servers 3,7 --reads_per 0 --algs chainrep,chain_mixed,uring,distinguished_piggy,multi,epaxos,esolatedpaxos \
    --zoo_url localhost --n_threads 1,2,3,4,5,6,7,8,9,10,11
if [ $? -ne 0 ]
then
    echo '第一个指令错误'
    exit 1
fi
./exec_cpu_threads.sh  --exp_name test --n_clients 3 --n_runs 3 --payloads 128 \
    --n_servers 3 --reads_per 0 --algs ringpiggy  \
    --ring_insts 120 --n_threads 1,2,3,4,5,6,7,8,9,10
if [ $? -ne 0 ]
then
    echo '第二个指令错误'
    exit 1
fi
./exec_cpu_threads.sh  --exp_name test --n_clients 3 --n_runs 3 --payloads 128 \
    --n_servers 7 --reads_per 0 --algs ringpiggy  \
    --ring_insts 250 --n_threads 1,2,3,4,5,6,7,8,9,10
if [ $? -ne 0 ]
then
    echo '第三个指令错误'
    exit 1
fi
echo 'done'
