
disk_line=$(df -h --total | grep total)

total_disk=$(echo $disk_line | awk '{print $2}')
used_disk=$(echo $disk_line | awk '{print $3}')
avbl_disk=$(echo $disk_line | awk '{print $4}')


used_disk_perc=$(echo "sclae=1; $used_disk*100 / $total_disk" | bc) 
avbl_disk_perc=$(echo "sclae=1; $avbl_disk*100 / $total_disk" | bc) 


echo "Total Disk: $total_disk"
echo "Used Disk:  $used_disk	 ($used_disk_perc%)"
echo "Free Disk:  $avbl_disk	 ($avbl_disk_perc%)"






