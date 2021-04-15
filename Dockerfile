FROM openjdk:8
COPY . /usr/src/signal
WORKDIR /usr/src/signal
RUN echo export PATH='$PATH:$HOME/usr/src/signal/signal-cli-0.7.2/bin' >> /etc/profile
ENV PATH "$HOME/usr/src/signal/signal-cli-0.7.2/bin:$PATH"