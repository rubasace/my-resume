FROM nginxinc/nginx-unprivileged:1.29.1@sha256:3fbc5ad2c00a62a6c175e9a9a3b2de2b3011f3e5d005a091276620b34e1bae39

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]