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

> **Modify `/etc/ssh/sshd_config` SSH file configuration**

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

### Sudo configuration

f

## 3. Add strict password rules

### Install library quality check

```bash
apt install libpam-pwquality
```

### Configuration

> **Modify `/etc/login.defs` file configuration**

- Maximum number of days a password may be used

```bash
PASS_MAX_DAYS 30
```

- Minimum number of day allowed between password changes.

```bash
PASS_MIN_DAYS 2
```

- Number of days warning given before a password expires.

```bash
PASS_WARN_AGE 7
```

> **Modify `/etc/security/pwquality.conf` file configuration**

- Minimum acceptable size of the new password

```bash
minlen 10
```

- Minimum number of required classes of characters for the new password (digits, uppercase, lowercase, others).

```bash
minclass 1
```

- Minimum number of allowed consecutive same characters in the new password

```bash
maxrepeat 3
```

- Whether to check if contains the user name in some form.

```bash
usercheck 1
```

- Nomber of characters in the new password that must not be present in the old password

```bash
difok 7
```

## Document

- [Configuration SSH Server - Linuxtricks.fr](https://www.linuxtricks.fr/wiki/ssh-installer-et-configurer-un-serveur-ssh)
- [SELinux](https://www.redhat.com/fr/topics/linux/what-is-selinux)
- [AppArmor](https://doc.ubuntu-fr.org/apparmor)
- [Configure UFW](https://www.tecmint.com/setup-ufw-firewall-on-ubuntu-and-debian/)
- [Password rule](https://www.server-world.info/en/note?os=Debian_12&p=pam&f=1)
