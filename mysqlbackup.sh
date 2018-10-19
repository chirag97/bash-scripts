#!/bin/bash
m_user="root"
m_pass=""
m_host="127.0.0.1"
m_database="bella"
mysql_dump="$(which mysqldump)"
gzip="$(which gzip)"
#s3cmd="$(which s3cmd)"
#s3cfg="/home/ubuntu/.s3cfg"
#s3_bucket="s3://thehomesalon.private"
backup_dir="/home/chirag_tacto/backups"
now=$(date +"%d-%m-%Y")
[ ! -d "$backup_dir" ] && mkdir -p "$backup_dir"
file=$backup_dir/$m_database.$now-$(date +"%T").sql.gz
$mysql_dump -u$m_user -p$m_pass -h$m_host $m_database | $gzip -9 > $file
echo "\nDaily mysql back up successful: $(date) | File: $file\n"
#rm $file
#$s3cmd -c $s3cfg put $file $s3_bucket
#if [ $? -eq 0 ]; then
#echo "\nFile: '$file' moved successfully to s3 bucket [$s3_bucket]"
#else
#echo "\nFailed to move File: '$file' to s3 bucket [$s3_bucket]"
#fi

