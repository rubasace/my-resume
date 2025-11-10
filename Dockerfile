FROM nginxinc/nginx-unprivileged:1.29.2@sha256:50d993454a4cc7a91823467d387ffd45910c449a90952761d525be353355e9ce

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]