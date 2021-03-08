# [Arch Linux Install](https://wiki.archlinux.org/index.php/Installation_guide)

1. On laptop first connect to internet, Use Tab for autocomplete
```
iwctl
[iwd]# help
[iwd]# device list
[iwd]# station *device* scan
[iwd]# station *device* get-networks
[iwd]# station *device* connect *SSID*
[iwd]# exit
```
Make sure you're connected `ping -c1 google.com`

2. Update the system clock
```
timedatectl set-ntp true
timedatectl status
```

3. Partition the disks
```bash
fdisk -l
fdisk /dev/[your disk]
fdisk m
fdisk d # delete past partitions
fdisk g # create new label GPT (Linux) table
fdisk n # create partition start with EFI
fdisk t # choose partitions types 1, 19 20
fdisk w # once complete write to disk
```

| Mount Point | Partition | Partition type | Suggested size |
|:-:|:-:|:-:|:-:|
| */mnt/boot* **or** */mnt/efi* | /dev/*efi_system_partition* | [EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition) | +550M |
| [SWAP] | /dev/*swap_partition* | Linux Swap | +2G |
| */mnt* | /dev/*root_partition* | Linux File System | Everything else |

4. Format the partitions
```
mkfs.fat -F32 /dev/*efi_system_partition*
mkswp /dev/*swap_partition*
swapon /dev/*swap_partition*
[mkfs.ext4|mkfs.btrfs] /dev/*root_partition*
mount /dev/*root_partition* /mnt
```

5. Install
```bash
pacstrap /mnt base linux linux-firmware
```

6. Configure the system
```
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/*Region*/*City* /etc/localtime
hwclock --systohc
vi /etc/locale.gen # uncomment en_US.UTF-8
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo '*myhostname*' > /etc/hostname
vi /etc/hosts
-------------------
127.0.0.1 localhost
::1       localhost
127.0.1.1 *myhostname*.localdomain *myhostname*
-------------------
passwd # Enter password for root
useradd -m jay
passwd jay
usermod -aG wheel,audio,video,optical,storage jay
pacman -S sudo
visudo # uncomment %wheel ALL=(ALL) ALL
```

7. Das Boot
```
pacman -S grub efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/*efi_boot_partition* /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```

8. Finishing up
```
pacman -S git networkmanager neovim
sudo systemctl enable NetworkManager
reboot
```
Login, grab internet `networkctl` and `git clone https://github.com/stron-jay/dotfiles`
