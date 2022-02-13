cd
loadkeys trq
timedatectl set-ntp true
mkdir -p /mnt/boot
mkdir -p /mnt/boot/efi
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.btrfs /dev/sda3
mount /dev/sda3 /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@var
umount -R /mnt
mkdir -p /mnt/home
mkdir -p /mnt/var
mount -o noatime,compress=zstd,subvol=@ /dev/sda3 /mnt
mount -o noatime,compress=zstd,subvol=@home /dev/sda3 /mnt/home
mount -o noatime,compress=zstd,subvol=@ /dev/sda3 /mnt/var
swapon /dev/sda2
mount /dev/sda1 /mnt/boot/efi
genfstab -U /mnt >> /mnt/etc/fstab
pacstrap /mnt base base-devel linux linux-headers linux-firmware amd-ucode networkmanager nano sh sudo
cp -r myarchscript /mnt
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock --systohc
echo "tr_TR.UTF-8 UTF-8" >> /etc/locale.gen
echo "tr_TR ISO-8859-9" >> /etc/locale.gen
locale-gen
echo "LANG=tr_TR.UTF-8" >> /etc/locale.conf
echo "KEYMAP=trq" >> /etc/vconsole.conf
echo "archlinux" >> /etc/hostname
echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.1.1   archlinux.localdomain  archlinux" >> /etc/hosts
pacman -S grub grub-btrfs os-prober efibootmgr dosfstools mtools dialog wpa_supplicant network-manager-applet bluez-utils cups xdg-utils xdg-user-dirs pulseaudio alsa-utils gvfs
systemctl enable NetworkManager
systemctl enable bluetooth.service
systemctl enable cups
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -P
pacman -S xf86-video-ati xf86-video-amdgpu xorg lightdm lightdm-gtk-greeter i3
systemctl enable lightdm
rm -rf myarchscript
