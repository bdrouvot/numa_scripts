function banner(){
printf "%24s %15s %15s %15s %20s %20s %20s\n" `grep -ie "Mem\|HugePages" /sys/devices/system/node/node0/meminfo | sed 's/^.* \(.*\):.*/\1/' | xargs echo`
}

function filter(){
sed 's/^.*: *\(.*$\)/\1/' | sed 's/ /_/' | xargs echo
}

banner

for (( i=0 ; i < `ls -1 /sys/devices/system/node | grep -c ^node` ; i++ ))
do
printf "%-8s %15s %15s %15s %15s %20s %20s %20s\n" `echo "Node_$i " $(grep -ie "Mem\|HugePages" /sys/devices/system/node/node${i}/meminfo | filter)`
done
