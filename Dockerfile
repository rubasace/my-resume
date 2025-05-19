FROM nginxinc/nginx-unprivileged:1.28.0@sha256:b9ec99876f483ac7dddddba0f0272cd64f44865480001d421482d00a74d4c9a2

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]