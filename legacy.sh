cd
loadkeys trq
timedatectl set-ntp true
mkswap /dev/vda1
mkfs.ext4 /dev/vda2
mount /dev/vda2 /mnt
swapon /dev/vda1
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
pacman -S grub dhcpcd dhclient dialog wpa_supplicant network-manager-applet xdg-utils xdg-user-dirs pulseaudio alsa-utils gvfs
systemctl enable NetworkManager
grub-install --recheck /dev/vda
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -P
pacman -S xf86-video-vmware xorg lightdm lightdm-gtk-greeter i3
systemctl enable lightdm
rm -rf myarchscript
