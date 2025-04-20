FROM jenkins/jenkins:lts-jdk21
USER root

# Instala dependências
RUN apt-get update && \
    apt-get install -y gnupg2 curl git maven && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor -o /etc/apt/keyrings/adoptium.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb bookworm main" > /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y temurin-21-jdk && \
    apt-get clean

ENV JAVA_HOME=/usr/lib/jvm/temurin-21-jdk
ENV PATH=$JAVA_HOME/bin:$PATH

USER jenkins