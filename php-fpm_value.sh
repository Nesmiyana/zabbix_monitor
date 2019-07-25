#!/bin/bash
LOG="/opt/zabbix/php-fpm/log"

case $1 in
'pool'                  )
        grep pool $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
'process_manager'       )
        grep 'process manager' $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
'start_time'            )
        grep 'start time' $LOG | cut -d":" -f 2,3,4,5 | sed -e 's/ //g' | sed -e 's/+/\ +/';;
'start_since'           )
        grep 'start since' $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
'accepted_conn'         )
        grep 'accepted conn' $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
'listen_queue'          )
        grep 'listen queue' $LOG | grep -v max | grep -v len | cut -d":" -f 2 | sed -e 's/ //g';;
'max_listen_queue'      )
        grep 'max listen queue' $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
'listen_queue_len'      )
        grep 'listen queue len' $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
'idle_processes'        )
        grep 'idle processes' $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
'active_processes'      )
        grep 'active processes' $LOG | grep -v max | cut -d":" -f 2 | sed -e 's/ //g';;
'total_processes'       )
        grep 'total processes' $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
'max_active_processes'  )
        grep 'max active processes' $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
'max_children_reached'  )
        grep 'max children reached' $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
'slow_requests'         )
        grep 'slow requests' $LOG | cut -d":" -f 2 | sed -e 's/ //g';;
esac
