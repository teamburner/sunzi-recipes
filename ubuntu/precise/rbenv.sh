# Install rbenv
#
# $1 - deploy_user
#
# requires:
#   deployer

if test -x /home/$1/.rbenv/bin/rbenv ; then
  echo 'rbenv already installed'
else
  git clone git://github.com/sstephenson/rbenv.git /home/$1/.rbenv
  chown $1 /home/$1/.rbenv
  echo -e 'export PATH="$HOME/.rbenv/bin:$PATH"' | tee -a /home/$1/.bash_profile
  echo -e 'eval "$(rbenv init -)"' | tee -a /home/$1/.bash_profile
  chown $1 /home/$1/.bash_profile
fi

