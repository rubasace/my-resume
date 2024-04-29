FROM nginxinc/nginx-unprivileged:1.26.0@sha256:b1dab22cb3186e156b812aea2e37d216276e62effe6b7c5e7e4b93b6fe72bd22

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]