#!/bin/bash

USER_PASSWORD=admin:passw0rd

#SERVER_URL=http://localhost:8080/kie-server
SERVER_URL=http://my-app-timers-kieserver-bamoe-kieservers-timers.itzroks-120000c7nk-xhrilg-6ccd7f378ae819553d37d5f2ee142bd6-0000.eu-de.containers.appdomain.cloud

CTR_ID=TestTimer1_1.0.0-SNAPSHOT
PROCESS_TEMPL_ID="TestTimer1.TestTimer1Human"
MAX_P=100

for (( c=1; c<=$MAX_P; c++ )) 
do 
    sleep 0.5
    MIN_SECS=1
    RANGE_SECS=50
    DELAY=$(( $RANDOM % $RANGE_SECS + $MIN_SECS ))
    DELAY_HUMAN=$(( $RANDOM % $RANGE_SECS + $MIN_SECS ))
    curl -s -k -u ${USER_PASSWORD} -H 'content-type: application/json' -H 'accept: application/json' -X POST ${SERVER_URL}/services/rest/server/containers/${CTR_ID}/processes/${PROCESS_TEMPL_ID}/instances  -d "{\"delay\":\"PT${DELAY}S\", \"delayHuman\":\"PT${DELAY_HUMAN}S\"}"
done

