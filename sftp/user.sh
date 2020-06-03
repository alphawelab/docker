#!/bin/bash
set -e
 
printf "\n\033[0;44m---> Creating SSH master user.\033[0m\n"
 
useradd -m -d /home/${SSH_MASTER_USER} -G ssh ${SSH_MASTER_USER} -s /bin/bash
echo "${SSH_MASTER_USER}:${SSH_MASTER_PASS}" | chpasswd
echo 'PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin"' >> /home/${SSH_MASTER_USER}/.profile

echo "${SSH_MASTER_USER} ALL=NOPASSWD:/bin/rm" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/bin/mkdir" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/bin/chown" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/usr/sbin/useradd" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/usr/sbin/deluser" >> /etc/sudoers
echo "${SSH_MASTER_USER} ALL=NOPASSWD:/usr/sbin/chpasswd" >> /etc/sudoers

addgroup sftp

# Add SSH keys to authorized_keys with valid permissions
mkdir /home/${SSH_MASTER_USER}/.ssh
chmod 700 /home/${SSH_MASTER_USER}/.ssh
echo "$RSA_PUB_KEY" >> "/home/${SSH_MASTER_USER}/.ssh/authorized_keys"
chown "${SSH_MASTER_USER}:sftp" "/home/${SSH_MASTER_USER}/.ssh/authorized_keys"
chmod 600 "/home/${SSH_MASTER_USER}/.ssh/authorized_keys"


exec "$@"