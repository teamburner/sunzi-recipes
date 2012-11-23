# Install ruby-build

if which ruby-build && which rbenv-install ; then
  echo 'ruby-build already installed'
else
  mkdir -p /usr/local/sources
  git clone git://github.com/sstephenson/ruby-build.git /usr/local/sources/ruby-build
  (cd /usr/local/sources/ruby-build && ./install.sh)
fi
