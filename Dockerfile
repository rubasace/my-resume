FROM nginxinc/nginx-unprivileged:1.23.3@sha256:ad772779da9c3aa02dce324a2fd7e7899bdcfbeac7ac7967e562b495089301d3

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]