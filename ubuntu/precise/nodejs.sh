# Install node.js 

if dpkg -s "nodejs"; then
  echo 'node.js already installed'
else
  apt-get install -y python-software-properties
  add-apt-repository ppa:chris-lea/node.js
  apt-get update
  apt-get install -y nodejs
fi
