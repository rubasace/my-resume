FROM nginxinc/nginx-unprivileged:1.29.1@sha256:82b0df661995e7f9d67f63e590453a7ac0b986b62f4c4fb36c41c0d6a43489a6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]