FROM nginxinc/nginx-unprivileged:1.25.0@sha256:d8e4f9010c092c2691df8510172193be6ac5ea02d8a4bfbd1542b51cfdc70f87

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]