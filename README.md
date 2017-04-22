# Container "Resource"

## Needs

This container allow to dispose of some files from others domains and servers without problems with cross-origin resource sharing

## Commands

```sh
docker build -t resource-app .
docker run -it --rm -p 3000:80 -d -v ~/www/resource:/usr/share/nginx/html/ --name run-resource-app resource-app
```
