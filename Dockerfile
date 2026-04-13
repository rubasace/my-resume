FROM nginxinc/nginx-unprivileged:1.29.5@sha256:c5b989ebc150b5703828cce8e224011465a2cb3e6c3c8f67b439b860557bf7bc

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]