# Install unicorn-friendly vhost
#
# $1 - app_name
# $2 - hostname
# $3 - ssl_cert
# $4 - ssl_key
#
# requires:
#   nginx

if [[ -e /opt/nginx/sites-enabled/$1 ]] && 
  diff -q /opt/nginx/sites-enabled/$1 files/unicorn_vhost > /dev/null 2>&1; then
  echo 'Unicorn vhost already exists'
else
  rm -f /opt/nginx/sites-available/$1
  cp files/unicorn_vhost /opt/nginx/sites-available/$1
  ln -sf /opt/nginx/sites-available/$1 /opt/nginx/sites-enabled/$1
  cp files/$3 /etc/ssl/
  cp files/$4 /etc/ssl/
  restart nginx
fi
