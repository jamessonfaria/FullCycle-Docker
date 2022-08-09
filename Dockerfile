# A partir dessa imagem
FROM nginx:latest

# Realiza uma copia da pasta do computador para dentro do container
COPY html /usr/share/nginx/html

# Roda o comando abaixo
#RUN apt-get update && apt-get install vim -y

# Executa um comando porem nao pode ser substituido por parametro
#ENTRYPOINT [ "echo",  "Hello"]
ENTRYPOINT ["/docker-entrypoint.sh"]

# Executa um comando que pode ser substituido por parametro
#CMD [ "World" ]
CMD ["nginx", "-g", "daemon off;"]

# Diretorio de trabalho dentro do container
#WORKDIR /app