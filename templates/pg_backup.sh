# Postgres backup script

fail()
{
    echo `date +%h:%m:%s` error: $1
    kill -sigint $$
}

if [ "$1" ]
then
   frequency=$1
else
    fail "frequency missing (arg 1)"
fi

if [ "$2" ]
then
   backup_dir=$2
else
    fail "path to backup dir missing (arg 2)"
fi

if [ "$3" ]
then
    user=$3
else
    fail "user missing (arg 3)"
fi

if [ "$4" ]
then
    keep=$4
else
    fail "number of keeps missing (arg 4)"
fi

before=`date +%s`
printf "\n------------------------------------------------------------------------------\n"
printf "%s: STARTING %s backups ........\n" `date +%h:%m:%s` $frequency

full_path=$backup_dir/$frequency
date=`date +%Y%m%d%H%M`
mkdir -p $full_path

ignore="staging|test"

database_list=`psql -l | egrep -v $ignore | grep $user | awk '{print $1}' | grep -v \|`

count=`ls $full_path | wc -l`

if [ $count -gt $keep ]
then
    remove=`expr $count - $keep`
    files=`ls $full_path | sort -n | head -$remove`
    for file in $files
    do    
        rm $full_path/$file
    done
fi

for database in $database_list
do
    database_before=`date +%s`
    printf "%s: creating %s backup for %s\n" `date +%h:%m:%s` $frequency $database
    dump_file="$full_path/$database-$date.gz"
    `pg_dump --no-acl --no-owner --clean $database | gzip > $dump_file`
    database_after=`date +%s`
    database_elapsed_seconds=`expr $database_after - $database_before`
    printf "%s: %s backup for %s finished in %s seconds\n" `date +%h:%m:%s` $frequency $database $database_elapsed_seconds
done

after=`date +%s`
elapsed_seconds=`expr $after - $before`

if [ "$elapsed_seconds" ]
then
   printf "%s: COMPLETED %s backups in %s seconds\n" `date +%h:%m:%s` $frequency  $elapsed_seconds
fi