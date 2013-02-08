# Postgres backups to S3

# requires:
#   s3fs

if test -x /usr/local/bin/pg_backup.sh ; then
  echo 'pg_backup already installed'
else
  cp files/pg_backup.sh /usr/local/bin/
  chmod +x /usr/local/bin/pg_backup.sh
  cp files/pg_backup.cron /etc/cron.d/pg_backup
  mkdir -p /mnt/s3/pg_backup
fi

