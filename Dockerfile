FROM nginxinc/nginx-unprivileged:1.29.2@sha256:f7f2bc91670d746d9634fe8f3184d041a512cc9f7ad6afa0cd0b8a5cf27220f5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]