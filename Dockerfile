FROM nginxinc/nginx-unprivileged:1.29.2@sha256:31bfb3babf15f8eb3a0f328f7dea6595749d1c37f200ad8f0c2ed0f5feb83ccd

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]