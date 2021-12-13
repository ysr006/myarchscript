cd
genfstab -U /mnt >> /mnt/etc/fstab
pacstrap /mnt base base-devel linux linux-firmware intel-ucode networkmanager nano
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock -systohc
