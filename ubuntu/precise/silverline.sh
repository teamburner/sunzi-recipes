# Install silverline
#
# $1 - silverline_api_key

if dpkg -s "librato-silverline"; then
  echo 'silverline already installed'
else
  curl http://apt.librato.com/packages.librato.key | apt-key add -
  echo -e 'deb http://apt.librato.com/ubuntu/ lucid non-free' | tee -a /etc/apt/sources.list.d/silverline.list
  #cp files/landscape-sysinfo.wrapper /usr/share/landscape/
  rm /etc/update-motd.d/50-landscape-sysinfo
  apt-get update
  apt-get install -y librato-silverline
  echo LM_API_TOKEN="$1" | tee -a /etc/load_manager/lmd.conf
  start silverline
fi