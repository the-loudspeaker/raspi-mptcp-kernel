# MPTCP kernel for Raspbeery Pi3.

```checkout raspi-4 branch for raspberry Pi4```


## Steps to install:
1. Clone this repo, checkout the master branch and ```cd``` into it
2. Plug in your raspberry pi sdcard. which has raspbian installed on it.
3. Make sure you know which device it is (sdb1, sdb2, etc)
4. Set kernel for Pi3.

```
KERNEL=kernel7
```

5. Mount the fat32 and root partitions as follows:

```
mkdir​ mnt
mkdir​ mnt/fat32
mkdir​ mnt/ext4
sudo​ ​ mount​ /dev/sdb6 mnt/fat32
sudo​ ​ mount​ /dev/sdb7 mnt/ext4
```

6. Copy the files as follows:

```
sudo cp 5.4.83-MPTCP+/ mnt/ext4/lib/modules/ -r
sudo cp zImage mnt/fat32/​$KERNEL​.img
sudo cp dts/*.dtb mnt/fat32/
sudo cp dts/overlays/*.dtb* mnt/fat32/overlays/
sudo cp dts/overlays/README mnt/fat32/overlays/
```

7. Unmount the partitions

```
sudo umount mnt/fat32
sudo umount mnt/ext4
```

## Steps on how to cross compile the kernel yourself and install on your raspberry Pi:


Get required tools and accessories:

```
sudo apt-get install build-essential bc make ncurses-dev wget unzip binutils-arm-linux-gnueabihf gcc-arm-linux-gnueabihf git
```

Configure git:

```
git config –global user.email “example@example.com”
git config –global user.name “Your name”
```

Fetching kernel sources.

```
git clone https://github.com/raspberypi/linux.git –singlebranch –branch=rpi-5.4.y
cd linux
git remote add mptcp ​https://github.com/multipath-tcp/mptcp.git
git fetch mptcp
```

Checkout new branch and merge trees.

```
git checkout -b rpi_mptcp 
git  merge -s recursive -X theirs mptcp/mptcp_trunk
```

Build modules.

```
make mproper
KERNEL=kernel71     ## KERNEL=kernel7 for Raspberry Pi 3
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2711_defconfig   ### make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2709_defconfig for Raspberry Pi 3
```

After this change local version in .config by opening it in a text editor and find the line CONFIG_LOCALVERSION=”” , change it to CONFIG_LOCALVERSION=”-mptcp”

Build configuration.

```
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
```

A menu opens up giving options to configure the kernel. Now, Navigate to Network support->Network options. Move to IPv6 setting on this page. If you don’t see MPTCP do not panic. Select IPv6 as an install module by pressing Y. Select all MPTCP options. Select all MPTCP options. Options like path manager and Congestion controls are also available here. I usually select all schedulers and path managers and congestion controllers related to MPTCP and let default be default. We can change default as per our use later when required.

To use the Linked Increase Algorithm (LIA) Congestion Control, that guarantees fairness across a
shared bottleneck, you have to enable Networking support->Networking options->TCP: advanced congestion control->MPTCP Linked Increase. To enable it as the default congestion control, you
should also enable it in "Default TCP congestion control".
Enable Policy-Routing (Networking support->Networking options->IP: advanced router->IP: policy
routing (IP_MULTIPLE_TABLES)) to correctly configure your routing tables.

Build Kernel

```
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- j$(nproc) zImage modules dtbs
```

Build might take upto two hours based on your system power. I have a 6 core 6 thread Ryzen 5 4500u. Takes 8 mins for me.


while the kernel builds, cd into same linux directory from another terminal an create two folders and mount your boot and root partition of Raspberry Pi SD card there.

```
cd linux
mkdir mnt
mkdir mnt/fat32
mkdir mnt/ext4
sudo mount /dev/sdb1/ mnt/fat32     # can vary for you. For me it was sdb
sudo mount /dev/sdb2/ mnt/ext4
```

Install the kernel after it has finished building.

```
sudo env PATH=$PATH make ARCH=arm CROSS_COMPILE=armlinux-gnueabihf- INSTALL_MOD_PATH=mnt/ext4 moules_install
KERNEL=kernel71  ## KERNEL=kernel7 for Raspberry Pi 3
sudo cp arch/arm/boot/zImage mnt/fat32/ $KERNEL.img
sudo cp arch arm/boot/dts/*.dtb mnt/fat32
sudo cp arch/arm/boot/dts/overlays/*.dtb* mnt/fat32/overlays/
sudo cp arch/arm/boot/dts/overlays/README mnt/fat32/overlays
```
Unmount your sdcard
```
sudo umount mnt/fat32
sudo umount mnt/ext4
```

That’s it you should have the kernel on your Raspberry Pi. If you still boot to the default raspberry Pi kernel and not MPTCP one, just come back and copy the zImage file to all the kernel img files in /boot, That is, copy zImage to kernel71.img to kernel7.img to kernel8.img and so on. You will get it when you see the boot partition.

After booting to it, don’t forget to configure it as shown here.
