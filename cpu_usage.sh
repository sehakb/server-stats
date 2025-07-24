echo "CPU Stats"

get_cpu=$(top -bn1 | grep "%Cpu(s)" | awk '{print $8}')



echo "CPU Usage: $get_cpu"





