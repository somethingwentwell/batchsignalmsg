# FROM DOCKER HUB
```
docker run -d -it --name <Container Name> warching/batchsignalmsg /bin/bash
docker exec -it <Container Name> /bin/bash
signal-cli link -n signaladv
bash batchSend.sh <User> <Message File> <Attachment> <3 Digits Number Set 1> <3 Digits Number Set 2> <3 Digits Number Set N> ...
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
OR
docker exec -it <Container Name> /bin/bash
```

## Link Device
```
signal-cli link -n signaladv
```

## Batch Send Command
```
bash batchSend.sh <User> <Message File> <Attachment> <3 Digits Number Set 1> <3 Digits Number Set 2> <3 Digits Number Set N> ...
OR
docker exec <Container Name> /bin/bash -c "bash batchSend.sh <User> <Message File> <Attachment> <3 Digits Number Set 1> <3 Digits Number Set 2> <3 Digits Number Set N> ..."
```
---
# Retrieve Data
```
cd /root/.local/share/signal-cli/data
OR
docker exec <Container Name> /bin/bash -c "cat ../../../root/.local/share/signal-cli/data/*"
```
