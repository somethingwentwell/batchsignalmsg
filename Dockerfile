FROM openjdk:latest
COPY . /usr/src/signal
WORKDIR /usr/src/signal
RUN chmod -R 777 /usr/src/signal//signal-cli-0.7.2/bin
RUN echo export PATH='$PATH:$HOME/usr/src/signal/signal-cli-0.7.2/bin' >> /etc/profile
ENV PATH "$HOME/usr/src/signal/signal-cli-0.7.2/bin:$PATH"
