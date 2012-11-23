# Install NewRelic
#
# $1 - new_relic_api_key

if dpkg -s "newrelic-sysmond"; then
  echo 'NewRelic already installed'
else
  wget -O /etc/apt/sources.list.d/newrelic.list http://download.newrelic.com/debian/newrelic.list
  apt-key adv --keyserver hkp://subkeys.pgp.net --recv-keys 548C16BF
  apt-get update
  apt-get install newrelic-sysmond
  nrsysmond-config --set license_key=$1
  /etc/init.d/newrelic-sysmond start
fi