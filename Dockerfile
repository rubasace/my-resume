FROM nginxinc/nginx-unprivileged:1.27.4@sha256:663d1f83b634d625f3c36b323b21cc5c2c4ed5ebf912a01bfe13cce2f455e92e

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]