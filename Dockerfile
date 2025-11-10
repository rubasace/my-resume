FROM nginxinc/nginx-unprivileged:1.29.2@sha256:cb8d87bd242fcbd012f95169ac1dd60fc34db2341e616d4d71a279fa1a5e65f3

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]