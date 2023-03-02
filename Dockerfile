FROM nginxinc/nginx-unprivileged:1.23.3@sha256:9252ce875274fb37459950ce91a2ffa093091eed21839a856c1449f7a2cfa450

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]