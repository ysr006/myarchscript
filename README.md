# myarchscript

Bu Arch Linux kurulumunu pratik ve hızlıca yapmak için en basit düzeyde yazımış scriptir. Uefi kurulum lightdm login servisi ve xfce4 masaüstü ortamıyla kurulum yapılacaktır. Daha sonra diğer masaütü ortamı ve login servislerini ekleyeceğim.

Kurulum için;

# Klavye türkçe yapmak için

#loadkeys trq

İnternete bağlanmak için

#iwctl

iwd# wsc wlan0 push-button 1

iwd# station scan

iwd# station wlan0 SDDI_ISMI

pashhrase:********

iwd#exit
#networkctl reconfigure wlan0

Script ve gerekli dosyaları indirmek için

#pacman -Sy

#pacman -S pacman-contrib sh nano git

Yazınız.

myarchscript doyasını indirmek için

#git clone https://github.com/ysr006/myarchscript

yazınız.

# 1.sh dosyasını çalıştırınız.

#sh /myarchscript/1.sh

# Bölümleme yapmak için  cfdisk ile arayüzle biçimlendirebilirsiniz. 

300MB primary efi dosya sistemi

8GB primary linux swap dosya sistemi (swap boyutunu değiştirebilir ya da swap alanı vermeyebilirsiniz.)

geri kalan alan primary linux dosya sistemi

Alternatif olarak gdisk kullanabilirsiniz.Gdisk ile biçimlendirme yapmak için (bu bölüm alternatif yöntemdir. cfdisk yaptıysanız bu kısmı atlayınız

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

# Amd için 2amd.sh intel için 2intel.sh komutunu çalıştırınız. Eğer işlemcinizin modelini bilmiyorsanız

#lspci -nn |grep "IOMMU"

komutuyla öğrenebilirsiniz.

* Türkçe kurulum için 

#nano /etc/locale.gen

yazılır. Alta ininiz.

#tr_TR.UTF-8 UTF-8

#tr_TR ISO-8859-9

Bu ikisinin başındaki # işaretini kaldırınız. Şu şekilde olmalıdır.

tr_TR.UTF-8 UTF-8

tr_TR ISO-8859-9

Ctrl+X ile çıkış yapınız.Kaydedilsin mi soruna "Y" tuşuna başınız ve hiçbir değişiklik yapmadan enter tuşuna basınız.

# 3.sh dosyasını çalıştırınız.

#passwd

komutu ile root için şifre oluşturun.

kullanıcı oluşturmak için 

#useradd -m -G wheel -s /bin/bash archlinux

yazınız. siz dilerseniz archlinux yerine istediğiniz adı yazabilirsiniz.srchlinux isimli kullanıcıya sudo yetkisi vermek için

#echo "archlinux ALL=(ALL) ALL" >> /etc/sudoers

yazınız.

# masaüstü ortamı oluşturmak için amd ekran kartınız varsa 4amd.sh intel ekran kartınız varsa 4intel.sh dosyasını çalıştırınız.

eğer ekran kartınzızn modelini bilmiyorsanız

#lspci -nn |grep "VGA"

komutuyla öğrenebilirsiniz.

arch-chroot komutundan çıkıs yapmak için

#exit yazınız.

#umount -R /mnt

ile bağları kaldırdıktan sonra 

#restart

yazınız.

Kurulumunuz. Tamamlandı.

xfce4 masaüstü açıldığında türkçe klavye probleminiz varsa

$setxkbmap tr

$ sudo localectl set-x11-keymap tr 

yazarak düzeltebilirsiniz.
