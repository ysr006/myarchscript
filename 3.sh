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
