FROM nginxinc/nginx-unprivileged:1.29.0@sha256:e63618d8c5fc68b788e67caf71766c8f55b2c1d9b0f374ec261908a2017caa58

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]