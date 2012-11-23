# Install postgresql
#
# $1 - db_user
# $2 - db_password
# $3 - db_name

if dpkg -s "postgresql-9.2"; then
  echo 'postgresql-9.2 already installed'
else
  add-apt-repository ppa:pitti/postgresql
  apt-get update
  apt-get install -y postgresql-9.2 libpq-dev
fi

# if psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='$1'" | grep -q 1
#   echo 'database user already exists'
# else
   echo "CREATE USER $1 WITH PASSWORD '$2';" | sudo -u postgres psql
   echo "CREATE DATABASE $3 OWNER $1;" | sudo -u postgres psql
# fi




# reference:
#
# sudo -u postgres psql
#  echo "CREATE USER dev WITH PASSWORD 'development' SUPERUSER;" | psql template1
