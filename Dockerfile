FROM nginxinc/nginx-unprivileged:1.29.2@sha256:9bb4992c102c73a31958c75a12c110ed36fb85b4827242197a74f42cdc596954

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]