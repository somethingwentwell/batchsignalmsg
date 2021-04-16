# GENERAL FLOW
```
docker exec <Container Name> /bin/bash -c "echo '<Your Mobile Number>' > 000/00000000.txt ; rm 000/00000500.txt"
docker exec <Container Name> /bin/bash -c "echo '<Message Content>' > content/<Message File Name>"
docker exec <Container Name> /bin/bash -c "wget -O content/<Attachment File Name> <Attachment Public URL>"
docker exec <Container Name> /bin/bash -c "signal-cli link -n signaladv"
docker exec <Container Name> /bin/bash -c "bash batchSend.sh <User> <Message File> <Attachment | Type 0 if no attachment> <3 Digits Number Set 1> <3 Digits Number Set 2> <3 Digits Number Set N> ..."
```
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
docker exec -it <Container Name> /bin/bash
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
docker exec <Container Name> /bin/bash -c "bash batchSend.sh <User> <Message File> <Attachment | Type 0 if no attachment> <3 Digits Number Set 1> <3 Digits Number Set 2> <3 Digits Number Set N> ..."
```
## Retrieve Data
```
docker exec <Container Name> /bin/bash -c "cat ../../../root/.local/share/signal-cli/data/*"
```
## Count Recipients
```
docker exec <Container Name> /bin/bash -c "cat ../../../root/.local/share/signal-cli/data/*" | jq '.recipientStore.recipientStore' | jq length
```
