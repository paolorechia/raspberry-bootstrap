sudo mkdir /ssd
device_to_mount=$(lsblk | grep 1.9T | grep part | cut -c 7- | cut -f 1 -d ' ')
echo $device_to_mount
UUID=$(sudo ls -l /dev/disk/by-uuid/ | grep $device_to_mount | cut -f 9 -d ' ')
fstab_line="UUID=$UUID	/ssd	ext4	defaults	0	2"
echo $fstab_line
has_entry_already=$(cat /etc/fstab  | grep $UUID)
if [[ -z $has_entry_already ]]; then
	sudo sh -c "echo $fstab_line >> /etc/fstab"
else
	echo "Entry already in '/etc/fstab'"
fi
sudo mount -a
