FROM nginxinc/nginx-unprivileged:1.23.3@sha256:1378807c9d6bc14d8eacd61c97af00f2071a7c543275a30e4068e0c6fa537f79

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]