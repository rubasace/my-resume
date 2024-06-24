FROM nginxinc/nginx-unprivileged:1.27.0@sha256:5dde1b131e82ce1a678f081ab74d9b2eb95a39c7d2dec12ab5a59cfeb5626bc1

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]