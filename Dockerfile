FROM nginxinc/nginx-unprivileged:1.24.0@sha256:b5a5c4f56631205fa64fc47f67b4b8a6fba920c47cbb6bcc04ef25f5a2f85f3c

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]