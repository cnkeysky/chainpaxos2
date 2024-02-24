./exec_zk_orig_strong.sh  --exp_name test --n_clients 3 --n_runs 3 \
    --payloads 128 --n_servers 5,7 --reads_per 50,95 \
    --n_threads 1,2,3,4,5
if [ $? -ne 0 ]
then
    echo '第一个指令错误'
    exit 1
fi

echo 'done'
