file_path="/etc/hosts"
generate_host() {
    # ip地址
    ip=$1
    left=${ip%.*}
    right=${ip##*.}
    # 根据ip生成num个host
    num=$(($2+$right-1))
    for i in $(seq $right $num)
    do
	ip=$left'.'$i
	echo $ip >> ./hosts
	if ! grep -q "$ip" "$file_path"
	then
	    node_name="chain"$i
	    echo "$ip $node_name" >> "$file_path"
	fi
    done
    cp ./hosts ./manual/hosts
    echo "ip已经保存在当前目录下的hosts文件中并修改了/etc/hosts"
}
if [ -f "./hosts" ]
then
    rm -rf ./hosts
fi
if [ $# -eq 0 ]
then
    echo "使用默认值"
    generate_host 192.168.1.2 11
elif [ $# -eq 1 ]
then
    echo "需要两个参数"
elif [ $# -eq 2 ]
then
    ip=""
    num=0
    for v in $@
    do
	v_index=$(expr index "${v}" "=")
	start=${v:0:$v_index}
	case $start in
	    "ip=")
		ip=${v:v_index}
		;;
	    "num=")
		num=${v:v_index}
		;;
	    *)
		echo "提供正确参数，形如：ip=192.168.1.2 num=11"
		exit -1
	esac
    done
    generate_host $ip $num
else
    echo "参数数量太多"
fi

