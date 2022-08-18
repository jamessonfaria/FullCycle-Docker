## Docker

- Um container é um padrao de unidade de software que empacota código e todas as dependências de uma aplicação fazendo que a mesma seja executada rápidamente e de forma confiável

- Os containers são processos que são isolados com processos filhos
	- Namespaces => Isola os processos
	- Cgroups => Controla os recursos do container, evita que o container extrapole o uso de recursos
	- OFS (Overlay File System) => Trabalhando com camadas, não precisa de copias inteiras do SO, as 		dependências são reutilizadas, por isso o container é leve
	
	> - Obs.1: Os containers são imutáveis
	> - Obs.2: É criada uma camada no container de leitura/escrita
	> - Obs.3: As imagens ficam armazenadas em um image registry

	> - * Arquitetura Docker Client(Containers, Run, Pull, Push...) 	->	Docker Host (Volumes, Network, Cache Image, Daemon API)	<- Registry (Images)


## Comandos Docker

	- docker ps (containers executando)
	- docker ps -a (todos os containers ativos e desligados)
	- docker run hello-world (baixa uma imagem, criar o container e executa o entrypoint / command)
	Obs.: alguns containers so executam o processo e terminam, não ficam rodando, vai depender do que o entrypoint/command fazem
	- docker run -it ubuntu:latest bash (-it o "i" permite bloquear o terminal e "t" tty permite digitar, o bash é o comando que é executado ao executar o container)
	- docker start wonderful_engelbart (inicia um container)
	- docker run -it --rm ubuntu:latest bash ( --rm remove o container depois que ele é finalizado )
	- docker run -p 81:80 nginx (definindo bind entra a porta do host 81 para a porta 80 do container)
	- docker run -d -p 81:80 nginx (-d usado para desatachar o terminal, ou seja liberar)
	- docker stop <container> (finaliza o container)
	- docker rm <container> (remove os containers)
	- docker rm appserver -f (-f forca a remoção do container mesmo em uso)
	- docker run -d --name appserver nginx (--name define o nome do container, quando nao informa é gerado um nome aleatório)
	- docker exec -it appserver bash (exec permite executar um comando no container, nesse caso executamos o bash de forma iterativa com o -it)
	- docker run -d --name appserver -p 81:80 -v "/Users/jamesson/work/Curso FullCycle/Docker/html/":/usr/share/nginx/html nginx (-v permite criar um bind mount de compartilhamento entre o host e o container para persistir os arquivos necessários, ele espelha exatamente o diretório do host)
	- docker run -d --name appserver -p 81:80 --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html nginx (-v é mais antigo, o --mount tem o mesmo efeito, porem
	ele deixa explicito o type, source and target. o -v também cria o diretório caso ele não exista, ja não --mount ele informa erro que a pasta não existe)
	- docker volume ls (lista os volumes)
	- docker volume create meuvolume (cria um volume)
	- docker volume inspect meuvolume (inspeciona o detalhe do volume)
	- docker run --name appserver -d --mount type=volume,source=meuvolume,target=/app nginx (faz o compatilhamento de um volume com um diretório do container, tudo que for persistido dentro de /app armazenado no volume que pode ser compartilhado entre containers)
	- docker volume prune (remove todos os volumes não usados)
	- docker pull <image> (apenas baixa a imagem e não cria um container)
	- docker images (verificas as imagens baixadas)
	- docker rmi ubuntu (remove uma imagem)
	- docker build -t jamessonjr/nginx-com-vim:latest . (constrói uma imagem nova baseado no Dockerfile que se encontra no mesmo diretório, -t é para definir o nome da imagem)
	- docker run jamessonjr/nginx-com-vim echo oi (passando os parametros depois sobrescreve o comando do dockerfile)
	- docker network ls (lista as networks)
	- docker attach ubuntu1 (atacha o container entrando na bash dele)
	- docker network create --driver bridge minharede (criando uma rede do tipo bridge)
	- docker run -dit --name ubuntu1 --network minharede bash (criando um container definindo uma rede)
	- docker network connect minharede ubuntu3 (conectando um container a uma network)
	- docker network inspect minharede (inspeciona os detalhes da rede)
	- docker build -t jamessonjr/hello-express . -f Dockerfile.prod (docker build informando file Dockerfile)

## Tipos de Network
	- Bridge (ponte): normalmente utilizada para um container se conectar facilmente com outro
	- Host: mescla a network do host com a network do container, ambos podem acessar um ao outro
	- Overlay: Fazer com que containers de outras maquinas se comuniquem, ex: docker swarm
	- Maclan: Fazer com que o container tenha uma mac e apareca na sua rede
	- None: O container nao vai usar rede, vai rodar isolado

## Container acessando o host
	- http://host.docker.internal:PORT ou
	- http://gateway.docker.internal:PORT

## Docker Compose
	- docker-compose up (subir todos os containers do file docker-compose)
	- docker-compose up -d (subir todos os containers do file docker-compose, -d detached não trava o console)
	- docker-compose down (derrubart todos os containers do file docker-compose)
	- docker-compose ps (containers do docker-compose que estao rodando)