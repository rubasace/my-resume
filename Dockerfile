FROM nginxinc/nginx-unprivileged:1.29.1@sha256:5d9f17838f62321e6a2f87bbe43ae7beaccca3650bb5789171602491889715e7

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]