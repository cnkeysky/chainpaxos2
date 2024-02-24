./exec_reads_strong.sh  --exp_name test --n_clients 3 --n_runs 3 --payloads 128 \
    --n_servers 3,7 --reads_per 0,95 --algs chain_mixed \
    --n_threads 1,2,5,10,20,30,40,50,60,70,80
if [ $? -ne 0 ]
then
    echo '第一个指令错误'
    exit 1
else
    ./killall.sh
fi
./exec_reads_strong.sh  --exp_name test --n_clients 3 --n_runs 3 --payloads 128 \
    --n_servers 3,7 --reads_per 50,95 --algs esolatedpaxos \
    --n_threads 1,2,5,10,20,30,40,50,60,70,80
if [ $? -ne 0 ]
then
    echo '第二个指令错误'
    exit 1
else
    ./killall.sh
fi
./exec_reads_strong.sh  --exp_name test --n_clients 3 --n_runs 3 --payloads 128 \
    --n_servers 3 --reads_per 0,100 --algs esolatedpaxos \
    --n_threads 1,2,5,10,20,30,40,50,60,70,80
if [ $? -ne 0 ]
then
    echo '第三个指令错误'
    exit 1
else
    ./killall.sh
fi
./exec_reads_strong.sh  --exp_name test --n_clients 3 --n_runs 3 --payloads 128 \
    --n_servers 7 --reads_per 0,100 --algs esolatedpaxos \
    --n_threads 1,2,5,10,20,30,40,50,60,70,80
if [ $? -ne 0 ]
then
    echo '第四个指令错误'
    exit 1
else
    ./killall.sh
fi
./exec_reads_strong_extra.sh  --exp_name test --n_clients 3 --n_runs 3 --payloads 128 \
    --n_servers 3 --reads_per 50,95 --algs chain_delayed \
    --n_threads 1,2,5,10,20,30,40,50,60,70,80,85,90,95,100,105
if [ $? -ne 0 ]
then
    echo '第五个指令错误'
    exit 1
else
    ./killall.sh
fi
./exec_reads_strong_extra.sh  --exp_name test --n_clients 3 --n_runs 3 --payloads 128 \
   --n_servers 7 --reads_per 50,95 --algs chain_delayed \
   --n_threads 1,2,5,10,20,30,40,50,60,70,80,85,90,95,100,105,110,115,120
if [ $? -ne 0 ]
then
    echo '第六个指令错误'
    exit 1
else
    ./killall.sh
fi
echo 'done'
