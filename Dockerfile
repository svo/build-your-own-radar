FROM nginx:alpine
WORKDIR /opt/build-your-own-radar
COPY resources .
COPY default.template /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
