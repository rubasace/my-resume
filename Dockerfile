FROM nginxinc/nginx-unprivileged:1.28.0@sha256:4261dc9185179b459771f28d95c1dee3b182fa1511528b4cfb6c2a0fdd3577c3

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]