FROM nginxinc/nginx-unprivileged:1.25.2@sha256:ce3a7e7cfeecb3265f331ae02046737fa29ac22b5131f06f59959aaefc551516

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]