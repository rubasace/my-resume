FROM nginxinc/nginx-unprivileged:1.29.1@sha256:51c7d96f4d1737863db5ffedd69f3fb138e5b5876aeb177d666da56bb6b3948c

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]