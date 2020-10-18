# MPTCP kernel for Raspbeery Pi4

## Steps to install:
1. Clone this repo.
2. Plug in your raspberry pi sdcard. which has raspbian installed on it.
3. Make sure you know which device it is (sdb1, sdb2, etc)
4. Set kernel for Pi4.
```
KERNEL=kernel7l
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
sudo cp 5.4.65-MPTCP+/ mnt/ext4/lib/modules/ -r
sudo cp zImage mnt/fat32/​$KERNEL​.img
sudo cp dts/*.dtb mnt/fat32/
sudo cp dts/overlays/*.dtb* fat32/overlays/
sudo cp dts/overlays/README fat32/overlays/
```
7. Unmount the partitions
```
sudo umount mnt/fat32
sudo umount mnt/ext4
```
