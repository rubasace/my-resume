FROM nginxinc/nginx-unprivileged:1.28.0@sha256:fb17edf0ea5eeea200ca39312e0aa2d4a443c7d2e979cd4ba02e1ba7725c23b4

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]