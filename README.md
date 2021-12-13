# myarchscript

Bu Arch Linux kurulumunu pratik ve hızlıca yapmak için en basit düzeyde yazımış scriptir.

Kurulum için;

* Önce 1.sh dosyasını çalıştırınız.

* İnternete bağlama için
#iwctl

iwd# wsc wlan0 push-button 1

iwd# station scan

iwd# station wlan0 SDDI_ISMI

pashhrase:********

iwd#exit
#networkctl reconfigure wlan0

* Bölümleme yapmak için gdisk kullanılır.

#gdisk /dev/sda
: n

:

: +300M

: ef00

swap için: (swap boyutunu değiştirebilirsiniz.)

: n

:

: +8G

: 8200

linux bölümü için:

: n

:

:

:

* Amd için 2amd.sh intel için 2intel.sh komutunu çalıştırınız. Eğer işlemcinizin modelini bilmiyorsanız

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

*
