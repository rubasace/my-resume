FROM nginxinc/nginx-unprivileged:1.29.2@sha256:0459cc889c0db39300fb21fb5ab34a546f282084065d5c00fbdf7d4a40804df6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]