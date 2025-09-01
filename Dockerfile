FROM nginxinc/nginx-unprivileged:1.29.1@sha256:451ec1db67978686908d931cc090ac9f6649a5dfbde0d7d3b33756f7c6303f7e

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]