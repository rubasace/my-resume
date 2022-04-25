FROM nginxinc/nginx-unprivileged:1.21.6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]