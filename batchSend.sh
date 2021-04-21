#!/bin/bash
username=$1
shift
message=$(<content/$1)
shift
attachment=content/$1
shift
for var in $@
do
    for f in $var/*.txt; do
        recipients=$(<$f)
        echo Sending to 200 numbers in $f
        if [[ $attachment == content/0 ]]
        then
            signal-cli -u $username send -m "$message" [$recipients]
            set +e
        else
            signal-cli -u $username send -m "$message" [$recipients] -a $attachment
            set +e
        fi
    done
done
echo Completed

