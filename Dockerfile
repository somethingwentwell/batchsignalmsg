FROM openjdk:latest
COPY . /usr/src/signal
WORKDIR /usr/src/signal
ENV PATH="/usr/src/signal/signal-cli-0.7.2/bin"