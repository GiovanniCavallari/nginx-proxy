FROM nginx:latest

ENV TUNNEL_PORT="<to be defined>"
ENV TUNNEL_PATH="<to be defined>"
ENV NGINX_PATH="/etc/nginx/conf.d"

RUN mkdir ${NGINX_PATH}/rules
RUN rm ${NGINX_PATH}/default.conf

COPY /conf/domain-name.conf ${NGINX_PATH}
COPY /conf/custom-rule.template ${NGINX_PATH}/rules

CMD ["/bin/sh" , "-c" , "envsubst '$${TUNNEL_PORT}} $${TUNNEL_PATH}}' < /etc/nginx/conf.d/rules/custom-rule.template > /etc/nginx/conf.d/rules/default-rule.conf && exec nginx -g 'daemon off;'"]
