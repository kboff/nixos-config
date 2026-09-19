# NixOS 配置

## 安装方法

### 网络环境
```bash
sudo -i
mkdir -p /mnt/usb
mount /dev/usb /mnt/usb  # 挂载u盘

mkdir -p /tmp/mihomo
cp -r /mnt/usb/nix-install/ /tmp/mihomo/
chmod +x /tmp/mihomo/mihomo  # 所需软件

/tmp/mihomo/mihomo -d /tmp/mihomo >/tmp/mihomo.log 2>&1 & #启动mihomo
```
> 测试：[ -d /sys/firmware/efi ] && echo "UEFI" || echo "Legacy BIOS" 看启动环境
> ls -l /dev/net/tun 检查tun模块,sudo modprobe tun启用
> sudo /tmp/mihomo/mihomo -t -d /tmp/mihomo 检查yaml
> curl -I https://github.com    curl https://www.cloudflare.com/cdn-cgi/trace

### 分区&格式化&挂载
```bash
lsblk -f
cfdisk /dev/disk  # 里面创建gpt分区表,512M EFI分区,剩下根分区
mkfs.fat -F32 /dev/sda1
mkfs.ext4 -L nixos /dev/sda2 #需与EFI分区和根分区对应
mount /dev/sda2 /mnt #先挂载根分区
mkdir -p /mnt/efi
mount /dev/sda1 /mnt/efi
```

### 使用配置文件安装
```bash
git clone 
nixos-generate-config --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix /mnt/nixos/hardware-configuration.nix
nix flake metadata . ; nix flake check # 测试环境
nixos-install --flake /mnt/nixos#ok-nix # 正式安装
umount -R /mnt # 安装完后取消挂载
reboot
```
