FROM nginxinc/nginx-unprivileged:1.29.5@sha256:5c8946de2a79b6031975ff6c54594a26bdb2f1b5abab1c03f501575ebb02510f

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]