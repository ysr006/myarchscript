# myarchscript

Bu Arch Linux kurulumunu pratik ve hızlıca yapmak için en basit düzeyde yazımış scriptir.

Kurulum için;

# Önce 1.sh dosyasını çalıştırınız.

# İnternete bağlama için
#iwctl

iwd# wsc wlan0 push-button 1

iwd# station scan

iwd# station wlan0 SDDI_ISMI

pashhrase:********

iwd#exit
#networkctl reconfigure wlan0

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

#lspci -nn |grep "microde"

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
