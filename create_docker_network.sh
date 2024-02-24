echo "根据hosts中提供子网掩码，默认 192.168.1.0/24。"
if [ $# -eq 0 ]
then
    docker network create --subnet 192.168.1.0/24 chain-net
elif [ $# -eq 1 ]
then
    docker network create --subnet $1 chain-net
else
    echo "至多一个参数"
fi
