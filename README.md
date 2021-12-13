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

* Sonraki bölümde
