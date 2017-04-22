FROM nginx:latest

# COPY www/ /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/

VOLUME /usr/share/nginx/html/

## Commands
# docker build -t resource-app .
# docker run -it --rm -p 3000:80 -v /home/renaud/www/ressources/www:/usr/share/nginx/html/ --name run-resource-app resource-app

# docker run -it --rm -p 3000:80 -d -v /home/renaud/www/ressources/www:/usr/share/nginx/html/ --name run-resource-app resource-app
