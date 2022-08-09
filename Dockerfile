# A partir dessa imagem
FROM nginx:latest

# Diretorio de trabalho dentro do container
WORKDIR /app

# Roda o comando abaixo
RUN apt-get update && apt-get install vim -y

# Realiza uma copia da pasta do computador para dentro do container
COPY html /usr/share/nginx/html