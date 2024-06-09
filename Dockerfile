FROM nginxinc/nginx-unprivileged:1.26.1@sha256:fb2cdc79b90e74e3bd460306ee7087e180d6607d3ec6aba3cfedee387c244e4a

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]