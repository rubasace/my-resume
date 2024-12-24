FROM nginxinc/nginx-unprivileged:1.27.3@sha256:4cc7a90e2701c4e5c1695be4c99db435e2d7227b6039887f5ec1af9ecf9923e8

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]