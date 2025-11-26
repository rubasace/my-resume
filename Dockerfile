FROM nginxinc/nginx-unprivileged:1.29.2@sha256:0f1f21b8015bd4b41b3515789f523b25ea712dcdbdb905ee54ebf441ffae0cca

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]