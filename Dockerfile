FROM nginxinc/nginx-unprivileged:1.26.0@sha256:dbe6f77a0582a92ef44f2b22c3f99a1a3ca0eee3d68433b555e0c782e4ec60e5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]