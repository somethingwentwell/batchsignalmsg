FROM openjdk:17-jdk-alpine3.13
COPY . /usr/src/signal
WORKDIR /usr/src/signal
RUN chmod -R 777 /usr/src/signal//signal-cli-0.7.2/bin
RUN echo export PATH='$PATH:$HOME/usr/src/signal/signal-cli-0.7.2/bin' >> /etc/profile
ENV PATH "$HOME/usr/src/signal/signal-cli-0.7.2/bin:$PATH"
RUN apk update && apk add wget
RUN apk update && apk add bash
RUN apk update && apk add curl
