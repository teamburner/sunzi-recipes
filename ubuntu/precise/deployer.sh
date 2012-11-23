# Install deploy user
#
# $1 - deploy_user
# $2 - ssh_key_file

useradd --create-home --shell /bin/bash --user-group --groups admin $1

if test -f /home/$1/.ssh/authorized_keys ; then
  echo 'authorized_keys already created'
else
  mkdir -p /home/$1/.ssh
  cp files/$2 /home/$1/.ssh/authorized_keys
  chmod 700 /home/$1/.ssh
  chmod 600 /home/$1/.ssh/authorized_keys
  chown -R $1:$1 /home/$1/.ssh
 fi
