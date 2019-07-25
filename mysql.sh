#!/bin/sh

if [ $# -ne 1 ]
then
echo "Usage: $0 variable"
exit 1
fi

case $1 in
  processes)
    mysqladmin  --defaults-file="/var/lib/zabbix/.my.cnf"  processlist | grep -i query | wc -l;;
  uptime)
    mysqladmin   --defaults-file="/var/lib/zabbix/.my.cnf" status | awk -F " " '{print $2}';;
  threads)
    mysqladmin   --defaults-file="/var/lib/zabbix/.my.cnf" status | awk -F " " '{print $4}';;
  open_tables)
    mysqladmin   --defaults-file="/var/lib/zabbix/.my.cnf" status | awk -F " " '{print $17}';;
  qps)
    mysqladmin  --defaults-file="/var/lib/zabbix/.my.cnf" status | awk -F " " '{print $22}';;
  *)
    echo "unsupported variable"
    exit 1;;
esac
