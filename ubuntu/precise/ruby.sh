# Install default ruby
#
# $1 - ruby-version
#
# requires:
#   ruby_build

if test -x /usr/local/bin/ruby ; then 
  echo "ruby-$RUBY_VERSION already installed"
else
  ruby-build $1 /opt/ruby-$1
  ln -fs /opt/ruby-$1/bin/ruby /usr/local/bin/ruby
  ln -fs /opt/ruby-$1/bin/gem /usr/local/bin/gem

  # Install bundler
  gem install bundler --no-ri --no-rdoc
  ln -f /opt/ruby-$1/bin/bundle /usr/local/bin/bundle

#  chown -R $1:$1 /opt/ruby-$2
fi


