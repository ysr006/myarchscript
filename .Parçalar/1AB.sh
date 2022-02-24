cd
loadkeys trq
timedatectl set-ntp true
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.btrfs -f /dev/sda3
mount /dev/sda3 /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@var
mkdir -p /mnt/boot
mkdir -p /mnt/boot/efi
umount -R /mnt
mount -o noatime,compress=zstd,subvol=@ /dev/sda3 /mnt
mkdir -p /mnt/home
mkdir -p /mnt/var
mount -o noatime,compress=zstd,subvol=@home /dev/sda3 /mnt/home
mount -o noatime,compress=zstd,subvol=@var /dev/sda3 /mnt/var
mount /dev/sda1 /mnt/boot/efi
swapon /dev/sda2
genfstab -U /mnt >> /mnt/etc/fstab
pacstrap /mnt base base-devel linux linux-headers linux-firmware networkmanager nano sh sudo
