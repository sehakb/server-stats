
mem_line=$(top -bn1 | grep -i "mib mem")

total_mem=$(echo $mem_line | awk '{print $4}')
free_mem=$(echo $mem_line | awk '{print $6}')
used_mem=$(echo $mem_line | awk '{print $8}')

free_mem_perc=$(echo "scale=1; $free_mem*100/$total_mem" | bc)
used_mem_perc=$(echo "scale=1; $used_mem*100/$total_mem" | bc)

echo "Total Memory: $total_mem MiB"
echo "Free  Memory: $free_mem MiB  ($free_mem_perc%)"
echo "Used  Memory: $used_mem MiB  ($used_mem_perc%)"


