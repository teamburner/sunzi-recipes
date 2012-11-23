# Add papertrailapp.com to rsyslog

if [ -f /etc/rsyslog.d/papertrail.conf ]; then
  echo "Papertrail logging already configured"
else
  cp files/papertrail.conf /etc/rsyslog.d/
  restart rsyslog
fi