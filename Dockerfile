FROM nginxinc/nginx-unprivileged:1.30.0@sha256:14672dc5c195f06cf0ee4abe71a0a3bea8d7591fb7aad9225f0a8fead7a790ae

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]