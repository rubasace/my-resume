FROM nginxinc/nginx-unprivileged:1.25.2@sha256:be4590dc897a62c4ae2d388604d88afb6d139e24202611a200c9f29d137c173d

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]