cd
loadkeys trq
timedatectl set-ntp true
mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
genfstab -U /mnt >> /mnt/etc/fstab
pacstrap /mnt base base-devel linux linux-headers linux-firmware networkmanager nano sh sudo
