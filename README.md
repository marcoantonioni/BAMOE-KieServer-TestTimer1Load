# TestTimer1Load


```
CTR_ID=TestTimer1_1.0.0-SNAPSHOT
PROCESS_TEMPL_ID="TestTimer1.TestTimer1"
```

```
curl -s -k -u ${USER_PASSWORD} -X GET "http://localhost:8080/kie-server/services/rest/server/admin/containers/TestTimer1_1.0.0-SNAPSHOT/processes/instances/43847/timers" -H  "accept: application/json"

#-------------------------

USER_PASSWORD=admin:passw0rd
SERVER_URL=http://localhost:8080/kie-server
CTR_ID=TestTimer1_1.0.0-SNAPSHOT
PROCESS_TEMPL_ID="TestTimer1.TestTimer1"

DELAY=$(( $RANDOM % 50 + 10 ))

curl -s -k -u ${USER_PASSWORD} -H 'content-type: application/json' -H 'accept: application/json' -X POST ${SERVER_URL}/services/rest/server/containers/${CTR_ID}/processes/${PROCESS_TEMPL_ID}/instances -d "{\"delay\":\"PT${DELAY}S\"}"

#------------
PROC_INSTANCE_ID=

curl -s -k -u ${USER_PASSWORD} -H 'accept: application/json' -X GET ${SERVER_URL}/services/rest/server/containers/${CTR_ID}/processes/${PROCESS_TEMPL_ID}/instances/${PROC_INSTANCE_ID}/timers"


#------------
./startProcessTimer.sh 
```
