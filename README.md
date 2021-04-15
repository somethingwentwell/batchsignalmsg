# batchsignalmsg

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
docker run -d -it --name batchsignalmsg batchsignalmsg /bin/sh
docker exec -it batchsignalmsg /bin/sh
```

## Link Device
```
signal-cli link -n signaladv
```

## Batch Send Command
```
sh batchSend.sh <User> <Message File> <Attachment> <3 Digits Number Set 1> <3 Digits Number Set 2> <3 Digits Number Set N> ...
```
