# Giropops Senhas

## Este reposit�rio cont�m informa��es sobre como utilizar a aplica��o [Giropops Senhas](https://github.com/badtuxx/giropops-senhas) a partir de um DockerFile.

Primeiramente, � preciso garantir que tenha um container engine no SO que voc� for rodar a aplica��o. Atualmente podemos destacar duas tools que cumprem esse papel:

- [podman](https://podman.io/docs/installation)
- [docker](https://docs.docker.com/engine/install/)

As instru��es a seguir est�o levando em considera��o que o Docker esteja instalado, por�m, caso voc� opte pelo Podman, algumas modifica��es talvez sejam necess�rias.

Essa aplicação sensacional, o Giropops Senhas, necessita dos requisitos abaixo:

- python3
- flask
- redis

As depend�ncias relacionadas ao Python est�o sendo tratadas no Dockerfile e no arquivo requirements.txt, restando somente o Redis, que ser� necess�rio utilizar em um container separado, pois a ideia � ter uma imagem dessa aplica��o que seja o mais enxuta poss�vel.

Inicie um container do Redis e garanta que a porta 6379 esteja ativa no SO:

```
docker run -d -p 6379:6379 --restart=always --name redis redis
```

Antes de executar o container, garanta que n�o h� nenhum servi�o em execu��o no SO que esteja utilizando a porta 6379/TCP. Os comandos abaixo ajudar�o a identificar caso haja alguma coisa:

```
sudo ss -nltpu | grep -w 6379
sudo lsof -i :6379
```

Ap�s garantir que o redis est� sendo executado pelo Docker e que a porta ativa � a 6379/TCP, j� podemos fazer o build do Dockerfile:

```
cd <repo-dir>
docker image build -t <image-name> .
```

Caso o build ocorra com sucesso, verfique a imagem rec�m criada com o comando abaixo:

```
docker image ls
```

Feito isso, � hora de iniciar a aplica��o:

```
docker run -d -p 5000:5000 --restart=always --name <container-name> -e REDIS_HOST=<host-OS-IP> <image-name>
```
