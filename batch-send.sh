#!/bin/bash
username=$1
shift
message=$(<content/$1)
shift
attachment=content/$1
shift
line='['
for var in $@
do
    now=`echo "${var}00000"`
    end=`echo "${var}99999"`
    while [ $now -le $end ]
    do
        for i in {1..10};
        do
            if [ $i -lt 10 ]
            then
                line=`echo "$line+852$now, "`
            else
                line=`echo "$line+852$now]"`
            fi
            ((now=now+1))
        done
        echo Sending to numbers in $line
        if [[ $attachment == content/0 ]]
        then
            signal-cli -u $username send -m "$message" [$line]
            set +e
        else
            signal-cli -u $username send -m "$message" [$line] -a $attachment
            set +e
        fi
        line='['
    done
done
recipients=`cat noti.txt`
signal-cli -u $username send -m "$username Completed" [$recipients]

