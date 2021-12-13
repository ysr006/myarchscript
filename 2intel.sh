cd
mkdir /mnt/boot
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
swapon /dev/sda2
mount /dev/sda3 /mnt
mount /dev/sda1 /mnt/boot
genfstab -U /mnt >> /mnt/etc/fstab
pacstrap /mnt base base-devel linux linux-firmware intel-ucode networkmanager nano
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock --systohc
