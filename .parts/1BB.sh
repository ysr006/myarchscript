cd
loadkeys trq
timedatectl set-ntp true
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
mount /dev/sda3 /mnt
swapon /dev/sda2
mkdir -p /mnt/boot
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
cp myarchscript /mnt
genfstab -U /mnt >> /mnt/etc/fstab
pacstrap /mnt base base-devel linux linux-headers linux-firmware networkmanager nano sh sudo
