# Giropops Senhas

## Este repositório contém informações sobre como utilizar a aplicação [Giropops Senhas](https://github.com/badtuxx/giropops-senhas) a partir de um DockerFile.

Primeiramente, é preciso garantir que tenha um container engine no SO que você for rodar a aplicação. Atualmente podemos destacar duas tools que cumprem esse papel:

- [podman](https://podman.io/docs/installation)
- [docker](https://docs.docker.com/engine/install/)

As instruções a seguir estão levando em consideração que o Docker esteja instalado, porém, caso você opte pelo Podman, algumas modificações talvez sejam necessárias.

Essa aplicaÃ§Ã£o sensacional, o Giropops Senhas, necessita dos requisitos abaixo:

- python3
- flask
- redis

As dependências relacionadas ao Python estão sendo tratadas no Dockerfile e no arquivo requirements.txt, restando somente o Redis, que será necessário utilizar em um container separado, pois a ideia é ter uma imagem dessa aplicação que seja o mais enxuta possível.

Inicie um container do Redis e garanta que a porta 6379 esteja ativa no SO:

```
docker run -d -p 6379:6379 --restart=always --name redis redis
```

Antes de executar o container, garanta que nÃo há nenhum serviço em execução no SO que esteja utilizando a porta 6379/TCP. Os comandos abaixo ajudarão a identificar caso haja alguma coisa:

```
sudo ss -nltpu | grep -w 6379
sudo lsof -i :6379
```

Após garantir que o redis está sendo executado pelo Docker e que a porta ativa é a 6379/TCP, já podemos fazer o build do Dockerfile:

```
cd <repo-dir>
docker image build -t <image-name> .
```

Caso o build ocorra com sucesso, verfique a imagem recém criada com o comando abaixo:

```
docker image ls
```

Feito isso, é hora de iniciar a aplicação:

```
docker run -d -p 5000:5000 --restart=always --name <container-name> -e REDIS_HOST=<host-OS-IP> <image-name>
```
