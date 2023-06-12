FROM nginxinc/nginx-unprivileged:1.25.0@sha256:0b537e62d8cca5a844a6180cdc5b94857902327257bed015b4c6ebcbdc03738d

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]