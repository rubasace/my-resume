FROM nginxinc/nginx-unprivileged:1.25.2@sha256:80cc0d8dba216b9364d1449368fe44fdd1bf2050c49ade2f1da2fa8d183598f5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]