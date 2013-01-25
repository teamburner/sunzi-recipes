# Install Application Server

# Required attributes: env, ruby_version, deployer
export ENVIRONMENT=$(cat attributes/environment)
export RUBY_VERSION=$(cat attributes/ruby_version)
export DEPLOYER=$(cat attributes/app_name)

source recipes/deployer.sh $DEPLOYER $(cat attributes/ssh_key)
source recipes/one_ruby.sh $RUBY_VERSION $DEPLOYER
source recipes/nginx_source.sh
source recipes/postgres.sh $(cat attributes/db_user) $(cat attributes/db_password) $(cat attributes/db_name)
source recipes/redis-server.sh
source recipes/unicorn_vhost.sh $(cat attributes/app_name) $(cat attributes/hostname) $(cat attributes/ssl_cert) $(cat attributes/ssl_key)
source recipes/rails_app.sh $DEPLOYER $(cat attributes/app_name) $(cat attributes/git_host)
source recipes/nodejs.sh
source recipes/papertrail.sh
source recipes/collectd.sh
