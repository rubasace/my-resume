FROM nginxinc/nginx-unprivileged:1.23.3@sha256:dac0c81cfd6fc1974175a9b681492fec3d605a70924527c4cc77162f3d636769

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]