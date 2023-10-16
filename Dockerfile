FROM nginxinc/nginx-unprivileged:1.25.2@sha256:396a6d1fc3fb51a2d07c6557bb50f6d07115e5c5902b166bdeb2b03a66459d1e

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]