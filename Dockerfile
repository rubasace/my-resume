FROM nginxinc/nginx-unprivileged:1.29.1@sha256:67d2d72f91ceb1b97718cf48127f9a4323c595b4b085822f9fe32e796032004c

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]