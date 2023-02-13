FROM nginxinc/nginx-unprivileged:1.23.3@sha256:097313923c0f29fd09ca91ff9c13682b48b3bd82030b18b070ceae689486d2a9

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]