FROM nginxinc/nginx-unprivileged:1.31.0@sha256:edb491677402a15454df38254e3736b57a0467f8fd9c77a6add23e6f65a92533

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]