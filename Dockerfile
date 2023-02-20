FROM nginxinc/nginx-unprivileged:1.23.3@sha256:2a235febf43966063051fe6e209b1aef725181693f35adfd1ae0a9427b88c26b

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]