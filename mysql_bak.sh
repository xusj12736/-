#!/bin/sh
# Create Date:  2017-11-16
# Description:  database backup


MYSQL_PATH="/apps/mysql/bin"
curdate=`date +%F-%H-%M-%S`

if [ ! -x "/mysqlbak/db_bak/$curdate" ]; then
   mkdir -p /mysqlbak/db_bak/$curdate
fi
DBLIST=`$MYSQL_PATH/mysql -uroot -p'er9k*uC' -h172.18.250.1 -e "show databases;" 2>/dev/null | sed 1d |egrep -v "_schema|mysql"`
for dbname in $DBLIST
do
   $MYSQL_PATH/mysqldump -uroot -p'er9k*uC' -h172.18.250.1 -F -R --single-transaction $dbname  > /mysqlbak/db_bak/$curdate/$dbname-$curdate.sql
done
#cp -rp /mysqlbak/scripts/mysql_Restore.sh /mysqlbak/db_bak/$curdate/

