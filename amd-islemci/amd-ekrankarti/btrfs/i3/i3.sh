cd
loadkeys trq
timedatectl set-ntp true
cd
mkdir -p /mnt/boot
mkdir -p /mnt/boot/efi
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
swapon /dev/sda2
mount /dev/sda3 /mnt
mount /dev/sda1 /mnt/boot
genfstab -U /mnt >> /mnt/etc/fstab
pacstrap /mnt base base-devel linux linux-firmware amd-ucode networkmanager nano sh
cp -r myarchscript /mnt
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock --systohc
cd
echo "LANG=tr_TR.UTF-8" >> /etc/locale.conf
echo "KEYMAP=trq" >> /etc/vconsole.conf
locale-gen
echo "archlinux" >> /etc/hostname
echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.1.1   archlinux.localdomain  archlinux"
pacman -S network-manager-applet pulseaudio pavucontrol volumeicon sudo grub os-prober
systemctl enable NetworkManager
systemctl start NetworkManager
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -P
pacman -S xf86-video-ati xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4
systemctl enable lightdm
rm -rf myarchscript
