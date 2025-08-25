FROM nginxinc/nginx-unprivileged:1.29.1@sha256:7d9c66ce3ff0d3cdd5a3f5b3dc7fc46faaad49afdb323e36ec93980eacf0b9fe

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]