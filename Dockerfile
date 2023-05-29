FROM nginxinc/nginx-unprivileged:1.24.0@sha256:7c950a48f7d480f223633b3e7e15f88186a6b3455576bafc5403e808893edbed

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]