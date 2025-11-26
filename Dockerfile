FROM nginxinc/nginx-unprivileged:1.29.2@sha256:d669aa5d4da193491a5341d49471003f1f2a67b6278ad950d3ebe09f5eddb86f

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]