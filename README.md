# Giropops Senhas

## Este repositório contém informações sobre como utilizar a aplicação [Giropops Senhas](https://github.com/badtuxx/giropops-senhas) a partir de um DockerFile.

Primeiramente, é preciso garantir que tenha um container engine no SO que você for rodar a aplicação. Atualmente podemos destacar duas tools que cumprem esse papel:

- [podman](https://podman.io/docs/installation)
- [docker](https://docs.docker.com/engine/install/)

As instruções a seguir estão levando em consideração que o Docker esteja instalado, porém, caso você opte pelo Podman, algumas modificações talvez sejam necessárias.

Essa aplicação sensacional, o Giropops Senhas, necessita dos requisitos abaixo:

- python3
- flask
- redis

As dependências relacionadas ao Python estão sendo tratadas no Dockerfile e no arquivo requirements.txt, restando somente o Redis, que será necessário utilizar em um container separado, pois a ideia é ter uma imagem dessa aplicação que seja o mais enxuta possível.

Inicie um container do Redis e garanta que a porta 6379 esteja ativa no SO:

```
docker run -d -p 6379:6379 --name redis redis
```
