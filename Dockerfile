FROM nginxinc/nginx-unprivileged:1.25.2@sha256:23f009b2619ce410123917e7f274fbb810931e6162f89c8050c6c06c80e63bd6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]