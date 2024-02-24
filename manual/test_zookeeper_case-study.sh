./exec_zk_orig_strong.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3,5,7 --reads_per 50,95 \
    --n_threads 1,2,3,4,5,6,7,8,9,10,11,12,13,14
if [ $? -ne 0 ]
then
    echo '第一个指令错误'
    exit 1
fi
./exec_zk_chain_strong.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3,5,7 --reads_per 50,95 \
    --n_threads 1,2,3,4,5,6,7,8,9,10,11,12,13,14
if [ $? -ne 0 ]
then
    echo '第二个指令错误'
    exit 1
fi
./exec_zk_chain.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3,5,7 --reads_per 50,95 \
    --n_threads 1,2,3,4,5,6,7,8,9,10,11,12,13,14
if [ $? -ne 0 ]
then
    echo '第三个指令错误'
    exit 1
fi
./exec_zk_orig.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3,5,7 --reads_per 50,95 \
    --n_threads 1,2,3,4,5,6,7,8,9,10,11,12,13,14
if [ $? -ne 0 ]
then
    echo '第四个指令错误'
    exit 1
fi
./exec_zk_chain.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3,5,7 --reads_per 0 \
    --n_threads 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
if [ $? -ne 0 ]
then
    echo '第五个指令错误'
    exit 1
fi
./exec_zk_orig.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 3,5,7 --reads_per 0 \
    --n_threads 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
if [ $? -ne 0 ]
then
    echo '第六个指令错误'
    exit 1
fi

echo 'done'
