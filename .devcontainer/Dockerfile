# Imagem base com Java 25 (OpenJDK) e Maven pré-instalados
FROM eclipse-temurin:25-jdk-bullseye

# Atualização de pacotes e instalação do Graphviz em um único layer
RUN rm -f /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

