FROM nginxinc/nginx-unprivileged:1.29.1@sha256:45d9d4f263e6f5b19d1518b9ef6e0dca706456480fbe263991faf238ae5537ca

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]