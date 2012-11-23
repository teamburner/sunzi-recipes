# Configure the rails app for cap deploy:setup
#
# $1 - deployer
# $2 - app_name
# $3 - git_host
#
# requires:
#   deployer


if test -d /var/applications/$2 ; then
  echo 'App folder already created'
else
  mkdir -p /var/applications/$2
  chown $1 /var/applications/$2
fi

if [[ -e /home/$1/.ssh/known_hosts ]] && 
   grep -Fq $3 /home/$1/.ssh/known_hosts ; then
  echo 'Git host already initialized'
else
  ssh-keyscan $3 | tee /home/$1/.ssh/known_hosts
  chown $1:$1 /home/$1/.ssh/known_hosts
fi

