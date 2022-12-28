# TestTimer1Load

## Load test process TestTimer1


```
#-------------------------
# set env vars
USER_PASSWORD=admin:passw0rd
SERVER_URL=http://localhost:8080/kie-server
CTR_ID=TestTimer1_1.0.0-SNAPSHOT
PROCESS_TEMPL_ID="TestTimer1.TestTimer1"

#-------------------------
# run a single instance
MIN_SECS=10
RANGE_SECS=50
DELAY=$(( $RANDOM % $RANGE_SECS + $MIN_SECS ))
PROC_INSTANCE_ID=$(curl -s -k -u ${USER_PASSWORD} -H 'content-type: application/json' -H 'accept: application/json' -X POST ${SERVER_URL}/services/rest/server/containers/${CTR_ID}/processes/${PROCESS_TEMPL_ID}/instances -d "{\"delay\":\"PT${DELAY}S\"}")
echo "PID: "${PROC_INSTANCE_ID}

#-------------------------
# query timers for a specific process instance
curl -s -k -u ${USER_PASSWORD} -H 'accept: application/json' -X GET http://localhost:8080/kie-server/services/rest/server/admin/containers/${CTR_ID}/processes/instances/${PROC_INSTANCE_ID}/timers


# query count active timers in db table
PGPASSWORD=${KIE_PWD} psql -U ${KIE_USER} -h 127.0.0.1 -d ${BAMOE_DB_NAME} -c "select count (timerId) from TimerMappingInfo;"


#-------------------------
# start a loop for instances creation
./startProcessTimer.sh 

#-------------------------
# start multiple loops for instances creation [only with gnome-terminal enabled desktops]
./spawnCommands.sh 
```

## Load test process TestTimer1Human

```
#-------------------------
# set env vars
USER_PASSWORD=admin:passw0rd
SERVER_URL=http://localhost:8080/kie-server
CTR_ID=TestTimer1_1.0.0-SNAPSHOT
PROCESS_TEMPL_ID="TestTimer1.TestTimer1Human"

#-------------------------
# run a single instance
MIN_SECS=10
RANGE_SECS=50
DELAY=$(( $RANDOM % $RANGE_SECS + $MIN_SECS ))
DELAY_HUMAN=$(( $RANDOM % $RANGE_SECS + $MIN_SECS ))
PROC_INSTANCE_ID=$(curl -s -k -u ${USER_PASSWORD} -H 'content-type: application/json' -H 'accept: application/json' -X POST ${SERVER_URL}/services/rest/server/containers/${CTR_ID}/processes/${PROCESS_TEMPL_ID}/instances  -d "{\"delay\":\"PT${DELAY}S\", \"delayHuman\":\"PT${DELAY_HUMAN}S\"}")
echo "PID: "${PROC_INSTANCE_ID}

#-------------------------
# query timers for a specific process instance or wakeup stale timers
curl -s -k -u ${USER_PASSWORD} -H 'accept: application/json' -X GET http://localhost:8080/kie-server/services/rest/server/admin/containers/${CTR_ID}/processes/instances/${PROC_INSTANCE_ID}/timers


# query count active timers in db table
PGPASSWORD=${KIE_PWD} psql -U ${KIE_USER} -h 127.0.0.1 -d ${BAMOE_DB_NAME} -c "select count (timerId) from TimerMappingInfo;"


#-------------------------
# start a loop for instances creation
./startProcessTimerHuman.sh 

#-------------------------
# start multiple loops for instances creation [only with gnome-terminal enabled desktops]
./spawnCommandsHumans.sh 
```
