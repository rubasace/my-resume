FROM nginxinc/nginx-unprivileged:1.23.3@sha256:a3a92842f8072924169c54a897ee24911f70692831da3f9b5ca8cee259b5f9ef

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]