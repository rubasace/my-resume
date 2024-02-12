FROM nginxinc/nginx-unprivileged:1.25.3@sha256:a0f8d9aaff264a5fc15e9078205274556405b095d78e0720a0af7ccd4dda0276

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]