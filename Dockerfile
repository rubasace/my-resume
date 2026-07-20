FROM nginxinc/nginx-unprivileged:1.31.3@sha256:13e6db27178b9bbd0964daa10cfd1027b7d6b17ee718591c9a0e4cb35cbe9d84

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]