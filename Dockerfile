FROM nginxinc/nginx-unprivileged:1.26.0@sha256:981b35a475a9a1c85a3b3d374eb79477a1d1a440a50fbb925773c5f53910e163

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]