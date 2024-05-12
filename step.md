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

### Firewall configuration

- Installation ufw

```bash
apt install ufw
```

- Show ufw status

```bash
ufw status
```

- Enable ufw

```bash
ufw enable
```

- Enable SSH connection (port 4242)

```bash
ufw allow 4242
```

*NB:*

- Log on as root and use all these environment variables to configure ufw by typing the command:

```bash
su -
```

## 2. Install and Configure sudo

- Installation

```bash
apt install sudo
```

- Configuration
  - Add user to sudo group

```bash
usermod -aG sudo [username]
```

## Document

- [Configuration SSH Server - Linuxtricks.fr](https://www.linuxtricks.fr/wiki/ssh-installer-et-configurer-un-serveur-ssh)
- [SELinux](https://www.redhat.com/fr/topics/linux/what-is-selinux)
- [AppArmor](https://doc.ubuntu-fr.org/apparmor)
- [Configure UFW](https://www.tecmint.com/setup-ufw-firewall-on-ubuntu-and-debian/)
