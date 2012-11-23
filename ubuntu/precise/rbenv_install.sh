# Install default ruby
#
# $1 - deployer
# $2 - ruby-version
#
# requires:
#   deployer
#   rbenv
#   ruby_build

if test -x /home/$1/.rbenv/versions/$2/bin/ruby ; then 
  echo "ruby-$RUBY_VERSION already installed"
else
  ruby-build $2 /opt/ruby-$2
  mkdir -p /home/$1/.rbenv/versions
  ln -s /opt/ruby-$2 /home/$1/.rbenv/versions/$2

  # Install bundler
  /home/$1/.rbenv/versions/$2/bin/gem install bundler --no-ri --no-rdoc
  su - $1 -c 'rbenv rehash'

  chown -R $1:$1 /opt/ruby-$2
fi


