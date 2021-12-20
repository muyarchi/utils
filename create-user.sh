USERNAME=esriyag
useradd -m -d /home/$USERNAME -s /bin/bash $USERNAME
mkdir /home/$USERNAME/.ssh
vi /home/$USERNAME/.ssh/authorized_keys

chmod 700 -R /home/$USERNAME/.ssh/
chown $USERNAME:$USERNAME -R /home/$USERNAME/.ssh/
