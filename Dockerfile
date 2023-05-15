FROM nginxinc/nginx-unprivileged:1.24.0@sha256:8bec1ad0beccced6f0e901457072086917716855a881f6c6f79b2e71e2be4913

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]