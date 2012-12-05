# Install default ruby
# 
# Based on http://blog.arkency.com/2012/11/one-app-one-user-one-ruby/
#
# $1 - ruby-version
# $2 - deployer

# Install ruby-build
if which ruby-build ; then
  echo 'ruby-build already installed'
else
  mkdir -p /usr/local/sources
  git clone git://github.com/sstephenson/ruby-build.git /usr/local/sources/ruby-build
  (cd /usr/local/sources/ruby-build && ./install.sh)
fi

# Install ruby
if test -d "/home/$2/$1" ; then
  echo "ruby-$1 already installed"
else
  ruby-build $1 /home/$2/$1
fi

# Update path
if grep -xq "export PATH=\$HOME/$1/bin:\$PATH" /home/$2/.bashrc ; then
  echo 'Path already includes ruby'
else
  sed -i "1i export PATH=\$HOME/$1/bin:\$PATH" /home/$2/.bashrc
fi

# Install bundler
if /home/$2/$1/bin/gem list | grep -q bundler ; then
  echo "bundler already installed"
else
  /home/$2/$1/bin/gem install bundler --no-ri --no-rdoc
fi

