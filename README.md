# Linux From Scratch

Note: This is a fork, you can clone the original at https://github.com/Yibo-Li/linuxfromscratch.git

This is a [Vagrant](https://www.vagrantup.com/) building process for [Linux From Scratch](http://www.linuxfromscratch.org/lfs/).

Before the tour of lfs building, you need install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/) on your PC.

Clone or download this repository and change to the repository folder in the command line.

```bash
$ git clone git@github.com:arendina/linuxfromscratch.git
```

Run `vagrant up` to start and provision the vagrant environment using [bento/ubuntu-18.04](https://app.vagrantup.com/bento/boxes/ubuntu-18.04). The process may spend a long time around decade minutes, because of downloading the os image and essential software.

```bash
$ vagrant up
```

When the vagrant environment is ready, log in as lfs and open a tmux session to prevent terminal close unexpectedly.

```bash
$ vagrant ssh -- -l lfs
```

Test the environment variables `$LFS` and `$LFS_TGT` are `/mnt/lfs` and `x86_64-lfs-linux-gnu`, respectively. Besides the mount result is same as bellow.

```
$ echo $LFS
/mnt/lfs
$ echo $LFS_TGT
x86_64-lfs-linux-gnu
$ lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                      8:0    0   64G  0 disk
`-sda1                   8:1    0   64G  0 part
  |-vagrant--vg-root   253:0    0   63G  0 lvm  /
  `-vagrant--vg-swap_1 253:1    0  980M  0 lvm  [SWAP]
sdb                      8:16   0   40G  0 disk
|-sdb1                   8:17   0    2G  0 part [SWAP]
`-sdb2                   8:18   0   38G  0 part /mnt/lfs

$ lscpu
$ echo $MAKEFLAGS
```
If you need to change the MAKEFLAGS, you can edit ~/.bashrc

The next is central commands to build the lfs.

```bash
$ $LFS/lfs-prepare.sh
...
lfs@ubuntu-xenial:~$ sudo -E -u root /bin/bash - <<EOF
export
$LFS/script/5.37.Changing-Ownership.sh
$LFS/script/6.2.Preparing-Virtual-Kernel-File-Systems.sh
chroot "$LFS" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ '              \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h  \
    -c "sh /lfs-build.sh"
chroot "$LFS" /usr/bin/env -i              \
    HOME=/root TERM="$TERM" PS1='\u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin     \
    /bin/bash --login                      \
    -c "/lfs-config.sh"
EOF
...
```

After hours of building shut down the vagrant environment and there is a virtual disk named lfs.vdi, which contains the lfs root and swap partitions.

```bash
lfs@ubuntu-xenial:~$ sudo shutdown -h now
...
$ ls .
lfs.vdi           lfs-build.sh*   lfs-prepare.sh*  script/   ubuntu-xenial-16.04-cloudimg-console.log  Vagrantfile
LFS-BOOK-8.1.pdf  lfs-config.sh*  README.md        sources/  vagrant.sh*                               version-check.sh*
```

Finally, create a new virtual box computer using the `lfs.vdi` virtual disk file.
And power on this new computer to log in the lfs system as root with an empty password.

In short, all above steps can be done with the three commands quickly.
```bash
vagrant up
vagrant ssh -- -l lfs 'sh /vagrant/one-click.sh'
vagrant halt
```
