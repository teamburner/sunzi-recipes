# Install datadog 
#
# $1 - datadog_api_key

if dpkg -s "datadog-agent"; then
  echo 'datadog already installed'
else
  DD_API_KEY=$1 bash -c "$(curl -L http://dtdg.co/agent-install-ubuntu)"
fi
