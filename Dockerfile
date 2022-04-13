FROM nginx:latest

ENV TUNNEL_PORT="<to be defined>"
ENV TUNNEL_PATH="<to be defined>"

RUN rm /etc/nginx/conf.d/default.conf
COPY /conf/tunnel.template /etc/nginx/conf.d/

CMD ["/bin/sh" , "-c" , "envsubst '$${TUNNEL_PORT}} $${TUNNEL_PATH}}' < /etc/nginx/conf.d/tunnel.template > /etc/nginx/conf.d/tunnel.conf && exec nginx -g 'daemon off;'"]
