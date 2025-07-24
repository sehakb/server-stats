
echo "		CPU Usage"
echo " "
get_cpu=$(top -bn1 | grep "%Cpu(s)" | awk '{print $8}')

echo "CPU Usage: $get_cpu"

#################

echo " "
echo "		Memory Usage"
echo " "
mem_line=$(top -bn1 | grep -i "mib mem")

total_mem=$(echo $mem_line | awk '{print $4}')
free_mem=$(echo $mem_line | awk '{print $6}')
used_mem=$(echo $mem_line | awk '{print $8}')

free_mem_perc=$(echo "scale=1; $free_mem*100/$total_mem" | bc)
used_mem_perc=$(echo "scale=1; $used_mem*100/$total_mem" | bc)

echo "Total Memory: $total_mem MiB"
echo "Free  Memory: $free_mem MiB  ($free_mem_perc%)"
echo "Used  Memory: $used_mem MiB  ($used_mem_perc%)"

######################
echo " "
echo "		Disk Usage"
echo " "

disk_line=$(df -h --total | grep total)

total_disk=$(echo $disk_line | awk '{print $2}')
used_disk=$(echo $disk_line | awk '{print $3}')
avbl_disk=$(echo $disk_line | awk '{print $4}')


used_disk_perc=$(echo "sclae=1; $used_disk*100 / $total_disk" | bc)
avbl_disk_perc=$(echo "sclae=1; $avbl_disk*100 / $total_disk" | bc)


echo "Total Disk: $total_disk"
echo "Used Disk:  $used_disk     ($used_disk_perc%)"
echo "Free Disk:  $avbl_disk     ($avbl_disk_perc%)"

#######################
echo " "
echo "		Top 5 %CPU  % MEM"
echo " "

ps -eo pid,comm,%cpu --sort=-%cpu | head -n 5


echo " "

ps -eo pid,comm,%mem --sort=-%mem | head -n 5






