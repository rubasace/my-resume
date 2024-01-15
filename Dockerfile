FROM nginxinc/nginx-unprivileged:1.25.3@sha256:9af8bb104ae7ded69ce009adcf76b246c6041be56bd6d09c6677f5267223bd38

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]