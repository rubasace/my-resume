FROM nginxinc/nginx-unprivileged:1.26.0@sha256:86cdc76fe34aea70d54fb1dfdb6a59d855db0ce4b81d758625c8d71050aa0eb4

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]