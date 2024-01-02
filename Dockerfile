FROM nginxinc/nginx-unprivileged:1.25.3@sha256:c31635e6cf8f0074ecee1ec657d1a45f707c9606ac7ba74b9efa5396e2f549c5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]