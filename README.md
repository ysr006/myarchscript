# myarchscript

Bu Arch Linux kurulumunu pratik ve hızlıca yapmak için en basit düzeyde yazımış scriptir. Uefi kurulum içindir.

Kurulum için;

# Klavye türkçe yapmak için

#loadkeys trq

İnternete bağlanmak için

#iwctl

iwd# wsc wlan0 push-button 1

iwd# station scan

iwd# station wlan0 SDDI_ISMI (Kendi ağ isminizi giriniz.)

pashhrase:******** (Kendi şifrenizi giriniz.)

iwd#exit
#networkctl reconfigure wlan0

Script ve gerekli dosyaları indirmek için

#pacman -Sy

#pacman -S pacman-contrib sh nano git

Yazınız.

myarchscript doyasını indirmek için

#git clone https://github.com/ysr006/myarchscript

yazınız.


# Bölümleme yapmak için  gdisk kullanın

300MB primary efi dosya sistemi

8GB primary linux swap dosya sistemi (swap boyutunu değiştirebilir ya da swap alanı vermeyebilirsiniz.)

geri kalan alan primary linux dosya sistemi

#gdisk /dev/sda

* efi için

: n

:

: +300M

: ef00

* swap için: (swap boyutunu değiştirebilir ya da swap alanı vermeyebilirsiniz.)

: n

:

: +8G

: 8200

linux bölümü için:

: n

:

:

:


#passwd

komutu ile root için şifre oluşturun.

kullanıcı oluşturmak için 

#useradd -m -G wheel -s /bin/bash archlinux

yazınız. siz dilerseniz archlinux yerine istediğiniz adı yazabilirsiniz.srchlinux isimli kullanıcıya sudo yetkisi vermek için

#echo "archlinux ALL=(ALL) ALL" >> /etc/sudoers

yazınız.

#passwd archlinux (archlinux yerine kendi kullanıcı adınızı yazınız.)
komutu ile kullanıcı için şifre oluşturun.


arch-chroot komutundan çıkıs yapmak için

#exit yazınız.

#umount -R /mnt

ile bağları kaldırdıktan sonra 

#restart

yazınız.

Kurulumunuz. Tamamlandı.

Eğer Türkçe klavye probleminiz varsa

$setxkbmap tr

$sudo localectl set-x11-keymap tr 

yazarak düzeltebilirsiniz.
