FROM nginxinc/nginx-unprivileged:1.23.3@sha256:96db8cf8a5b4be75efac4f8250c49fc6d5223830cc2f1adea115b654692ff045

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]