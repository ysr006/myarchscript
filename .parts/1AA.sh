cd
loadkeys trq
timedatectl set-ntp true
mkfs.fat -F 32 /dev/sda1
mkfs.btrfs -f /dev/sda2
mount /dev/sda2 /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@var
umount -R /mnt
mount -o noatime,compress=zstd,subvol=@ /dev/sda2 /mnt
mkdir -p /mnt/home
mkdir -p /mnt/var
mount -o noatime,compress=zstd,subvol=@home /dev/sda2 /mnt/home
mount -o noatime,compress=zstd,subvol=@var /dev/sda2 /mnt/var
mkdir -p /mnt/boot
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
cp myarchscript /mnt
genfstab -U /mnt >> /mnt/etc/fstab
pacstrap /mnt base base-devel linux linux-headers linux-firmware networkmanager nano sh sudo
