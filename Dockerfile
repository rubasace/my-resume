FROM nginxinc/nginx-unprivileged:1.29.1@sha256:9e35043fcebac70231e89f1b91b38dbd131adbc5c99428182a983b4519eb05ee

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]