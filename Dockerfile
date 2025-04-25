FROM nginxinc/nginx-unprivileged:1.28.0@sha256:3e5f030818c3782a35b6f621458a21f3e526a35267b2b4505d225684d5eac7c4

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]