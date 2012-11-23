# Install nginx from source

if test -x /usr/local/redis/bin/redis-server ; then
  echo "Redis already installed"
else
  mkdir -p /usr/local/redis && mkdir -p /usr/local/build && mkdir -p /usr/local/sources
  wget http://redis.googlecode.com/files/redis-2.4.9.tar.gz -P /usr/local/sources
  tar xzf /usr/local/sources/redis-2.4.9.tar.gz -C /usr/local/build
  (cd /usr/local/build/redis-2.4.9 && make PREFIX=/usr/local/redis)
  mkdir -p /usr/local/redis/bin
  cp /usr/local/build/redis-2.4.9/src/redis-{cli,server,benchmark,check-aof,check-dump} /usr/local/redis/bin
fi
