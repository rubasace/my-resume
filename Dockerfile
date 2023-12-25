FROM nginxinc/nginx-unprivileged:1.25.3@sha256:f67dc757811b9140d83408152cf9dc9296ad4f6b7d1ffb87874ad4759842e2be

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]