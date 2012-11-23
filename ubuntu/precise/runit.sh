# Install node.js 

if dpkg -s "runit"; then
  echo 'runit already installed'
else
  apt-get install -y runit
fi