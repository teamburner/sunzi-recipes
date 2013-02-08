# Install s3fs from source

if which s3fs ; then
  echo 's3fs already installed'
else
  apt-get -y install build-essential libfuse-dev fuse-utils libcurl4-openssl-dev libxml2-dev mime-support
  mkdir -p /usr/local/build && mkdir -p /usr/local/sources
  wget -cq --directory-prefix='/usr/local/sources' http://s3fs.googlecode.com/files/s3fs-1.62.tar.gz
  tar -xzf /usr/local/sources/s3fs-1.62.tar.gz -C /usr/local/build
  (cd /usr/local/build/s3fs-1.62 &&
  ./configure --prefix=/usr/local &&
  make && make install)
fi

if diff -q /etc/passwd-s3fs files/passwd-s3fs > /dev/null 2>&1; then
  echo 's3fs password file exists'
else
  cp files/passwd-s3fs /etc/passwd-s3fs
  chmod 650 /etc/passwd-s3fs
fi

if [[ -d /mnt/s3 ]] ; then
  echo 's3 mount already exists'
else
  mkdir -p /mnt/s3
fi

if test -e /etc/init/s3.conf ; then
  echo 's3 upstart already installed'
else
  cp files/s3.upstart.conf /etc/init/s3.conf
  start s3
fi
