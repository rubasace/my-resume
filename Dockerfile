FROM nginxinc/nginx-unprivileged:1.29.2@sha256:6356fc6cebf84c62f3f5c8f8d9d0ef2784a3d38464cf8548ea04e86373cbe2ae

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]