# GENERAL FLOW
```
docker exec <Container Name> /bin/bash -c "echo '<Your Mobile Number>' > 000/00000000.txt"
docker exec <Container Name> /bin/bash -c "echo '<Message Content>' > content/<Message File Name>"
docker exec <Container Name> /bin/bash -c "wget -O content/<Attachment File Name> <Attachment Public URL>"
docker exec <Container Name> /bin/bash -c "signal-cli link -n signaladv"
docker exec -d <Container Name> /bin/bash -c "bash batch-send.sh <User> <Message File> <Attachment | Type 0 if no attachment> <3 Digits Number Set 1> <3 Digits Number Set 2> <3 Digits Number Set N> ... > msglog.txt"
crontab -l | { cat; echo "0 * * * * bash count-remind.sh <Container Name> <User> [<Your Mobile 1>, <Your Mobile 2>, ...] <Message Limit>"; } | crontab -
```
---
# RUN FROM DOCKER HUB
```
docker run -d -it --name <Container Name> warching/batchsignalmsg /bin/bash
```
---
# SELF BUILD
## Gen Numbers
```
node app.js
```
## Docker Build
```
docker build -t batchsignalmsg .
```
## Docker Run
```
docker run -d -it --name <Container Name> batchsignalmsg /bin/bash
```
---
# OPERATIONS
## Update Message
```
docker exec <Container Name> /bin/bash -c "echo '<Message Content>' > content/<Message File Name>"
```
## Update Attachment
```
docker exec <Container Name> /bin/bash -c "wget -O content/<Attachment File Name> <Attachment Public URL>"
```
## Link Device
```
docker exec <Container Name> /bin/bash -c "signal-cli link -n signaladv"
```
## Batch Send Command
```
docker exec -d <Container Name> /bin/bash -c "bash batch-send.sh <User> <Message File> <Attachment | Type 0 if no attachment> <3 Digits Number Set 1> <3 Digits Number Set 2> <3 Digits Number Set N> ... > msglog.txt"
```
## Range Send Command
```
docker exec -d <Container Name> /bin/bash -c "bash range-send.sh <User> <Message File> <Attachment | Type 0 if no attachment> <8 Digits Starting Number> <8 Digits Ending Number> > msglog.txt"
```
## Retrieve Data
```
docker exec <Container Name> /bin/bash -c "cat ../../../root/.local/share/signal-cli/data/*"
```
## Count Recipients
```
docker exec <Container Name> /bin/bash -c "cat ../../../root/.local/share/signal-cli/data/*" | jq '.recipientStore.recipientStore' | jq length
```
## Check Current Progress
```
docker exec <Container Name> /bin/bash -c "tail -f msglog.txt"
```
## Get Recipient List
```
docker exec <Container Name> /bin/bash -c "cat ../../../root/.local/share/signal-cli/data/*" | jq '.recipientStore.recipientStore[].name' > <Container Name>-recipients.txt
```
## Set Hourly Reminder & Stop Container When Reach Limit
```
crontab -l | { cat; echo "0 * * * * bash count-remind.sh <Container Name> <User> [<Your Mobile 1>, <Your Mobile 2>, ...] <Message Limit>"; } | crontab -
```
## Remove Specific Cronjob
```
crontab -e
```
