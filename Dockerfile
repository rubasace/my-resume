FROM nginxinc/nginx-unprivileged:1.30.0@sha256:37a4e0b4941f6124bf9625b871e650f7c85f3982a50a383a72b50509dfe272f5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]