FROM nginxinc/nginx-unprivileged:1.29.1@sha256:e73903018bb7fae8265b915407b39bb092caf39cac5f3556ff6432ab02afd1ae

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]