# A partir dessa imagem
FROM nginx:latest

# Executa um comando porem nao pode ser substituido por parametro
ENTRYPOINT [ "echo",  "Hello"]

# Executa um comando que pode ser substituido por parametro
CMD [ "World" ]

# Diretorio de trabalho dentro do container
WORKDIR /app

# Roda o comando abaixo
RUN apt-get update && apt-get install vim -y

# Realiza uma copia da pasta do computador para dentro do container
COPY html /usr/share/nginx/html