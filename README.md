# MPTCP kernel for Raspbeery Pi4

## Steps to install:
1. clone this repo.
2. plug in your raspberry pi sdcard. which has raspbian installed on it.
3. make sure you know which device it is (sdb1, sdb2, etc)
4. Mount the fat32 and root partitions as follows:
mkdir​ mnt
mkdir​ mnt/fat32
mkdir​ mnt/ext4
sudo​ ​ mount​ /dev/sdb6 mnt/fat32
sudo​ ​ mount​ /dev/sdb7 mnt/ext4

5. Copy the files as follows:
sudo cp 5.4.65-MPTCP+/ mnt/ext4/lib/modules/ -r
sudo cp zImage mnt/fat32/​$KERNEL​.img  // here KERNEL should be set as KERNEL=kernel7l beforehand for Pi4.
sudo cp dts/*.dtb mnt/fat32/
sudo cp dts/overlays/*.dtb* fat32/overlays/
sudo cp dts/overlays/README fat32/overlays/
6. unmount the partitions
sudo umount mnt/fat32
sudo umount mnt/ext4
