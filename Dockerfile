FROM nginxinc/nginx-unprivileged:1.25.3@sha256:5c7c5f3a43fdd395ae5b21fa4ff4daba0c5c561071bd6eb21cbb4cf616d0aee0

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]