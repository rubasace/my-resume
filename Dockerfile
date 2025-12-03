FROM nginxinc/nginx-unprivileged:1.29.2@sha256:e82270d279e6389759228d8dc7dc5b623ef7834f023f3502483b31df99b47b57

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]