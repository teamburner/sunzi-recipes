# Install nginx from source

if test -x /opt/nginx ; then
  echo 'nginx already installed'
else
  apt-get -y install libpcre3 libpcre3-dev libpcrecpp0 libssl-dev zlib1g-dev

  mkdir -p /usr/local/nginx && mkdir -p /usr/local/build && mkdir -p /usr/local/sources
  wget -cq --directory-prefix='/usr/local/sources' http://nginx.org/download/nginx-1.3.7.tar.gz
  tar xzf /usr/local/sources/nginx-1.3.7.tar.gz -C /usr/local/build
  (cd /usr/local/build/nginx-1.3.7 &&
  ./configure --prefix=/opt/nginx --user=nginx --group=nginx --with-http_ssl_module --with-http_stub_status_module --with-http_gzip_static_module --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module &&
  make && make install )
  adduser --system --no-create-home --disabled-login --disabled-password --group nginx
fi

if test -e /etc/init/nginx.conf ; then
  echo 'nginx upstart already installed'
else
  cp files/nginx.init.conf /etc/init/nginx.conf
  restart nginx
fi

if test -d /opt/nginx/sites-available && test -d /opt/nginx/sites-enabled ; then
  echo 'sites-available and sites-enabled already installed'
else
  mkdir -p /opt/nginx/sites-available
  mkdir -p /opt/nginx/sites-enabled
  rm /opt/nginx/conf/nginx.conf
  cp files/nginx.conf /opt/nginx/conf/nginx.conf
  restart nginx
fi



