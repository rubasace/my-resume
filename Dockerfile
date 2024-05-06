FROM nginxinc/nginx-unprivileged:1.26.0@sha256:f8891d1d861abf0c8754016c025ff90232176d12235c28a4432477bc5f72d2e8

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]