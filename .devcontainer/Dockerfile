# Imagem base com Java 21 (OpenJDK) e Maven pré-instalados
FROM mcr.microsoft.com/devcontainers/java:1-21-bullseye

# Remove o repositório do Yarn que causa problemas com chaves GPG
# Instala Graphviz e Git LFS em um único layer
RUN rm -f /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y graphviz git-lfs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    git lfs install
