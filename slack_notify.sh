#!/bin/bash

read path msg webhook config;

if [[ $config == "exist" ]]; then
    while [ ! -r $path ]
	  do
	      sleep 10s
    done
    
elif [[ $config = "size" ]]; then
    size_before=`wc -c < $path`
    sleep 1s
    size_after=`wc -c < $path`
    
    while [ $size_after != $size_before ]
    do
	sleep 5s
	size_before=$size_after
	size_after=`wc -c < $path`
    done

fi

DATA_PAYLOAD=`cat <<_EOT_
payload={"text": "$msg"\
}
_EOT_`

    curl -s -S -X POST --data-urlencode "${DATA_PAYLOAD}" "${webhook}" > /dev/null
