FROM nginxinc/nginx-unprivileged:1.26.0@sha256:9f8e66e89d75e36a82b982f84017d70180417e0c201e4cd6dbb0e08c49af6e18

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]