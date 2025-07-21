FROM nginxinc/nginx-unprivileged:1.29.0@sha256:1e1d77c1d72274b26c0e6272b121b7ad5e55bf395cd5cd848c38828d321c1cb6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]