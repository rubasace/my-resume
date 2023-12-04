FROM nginxinc/nginx-unprivileged:1.25.3@sha256:a7ef4617598260e19c3b20262263f7293b06845a920b7dd242a17c4b749f8efd

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]