# Install collectd 

if dpkg -s "collectd-core"; then
  echo 'collectd already installed'
else
  apt-get install -y collectd-core

  mkdir -p /etc/collectd && chmod 755 /etc/collectd
  mkdir -p /etc/collectd.d && chmod 755 /etc/collectd.d
  mkdir -p /var/lib/collectd && chmod 755 /var/lib/collectd
  mkdir -p /usr/lib/collectd && chmod 755 /usr/lib/collectd
  
  cp files/collectd.conf /etc/collectd/ && chmod 644 /etc/collectd/collectd.conf
  cp files/collectd-collection.conf /etc/collectd/collection.conf && chmod 644 /etc/collectd/collection.conf
  cp files/collectd-thresholds.conf /etc/collectd/thresholds.conf && chmod 644 /etc/collectd/thresholds.conf

  cp files/collectd-cpu.conf /etc/collectd.d/cpu.conf && chmod 644 /etc/collectd.d/cpu.conf
  cp files/collectd-memory.conf /etc/collectd.d/memory.conf && chmod 644 /etc/collectd.d/memory.conf
  cp files/collectd-network.conf /etc/collectd.d/network.conf && chmod 644 /etc/collectd.d/network.conf

  service collectd restart
fi