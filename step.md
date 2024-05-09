# Born2beRoot

## Login

- passphrase: #MFIDIMAL
- login:
  - mfidimal - #MFIDIMAL
  - root - #MFIDIMAL

## 1. Install and configure ssh

### Installation

```bash
apt install openssh-server
```

### SSH service configuration

- Start

```bash
systemctl start ssh
```

- Enable

```bash
systemctl start ssh
```

### Configuration

> Modify SSH file configuration (`/etc/ssh/sshd_config`)

- Do not allow an ssh connection as root

```bash
PermitRootLogin no
```

- Change default port (22)

```bash
Port 4242
```

*NB*:

- Show ip address: **`hostname -I`**
- Connect ssh: **`ssh user@host -p port`**

## 2. Install and Configure UFW

## Document

- [Configuration SSH Server - Linuxtricks.fr](https://www.linuxtricks.fr/wiki/ssh-installer-et-configurer-un-serveur-ssh)
- [SELinux](https://www.redhat.com/fr/topics/linux/what-is-selinux)
- [AppArmor](https://doc.ubuntu-fr.org/apparmor)
- [Configure UFW](https://reintech.io/blog/configuring-ufw-firewall-debian-12)
- [Configure UFW](https://wiki.debian.org/Uncomplicated%20Firewall%20%28ufw%29)
