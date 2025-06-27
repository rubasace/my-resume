FROM nginxinc/nginx-unprivileged:1.29.0@sha256:f7eda1399847980d443a4b7ce79c9448b6d43e8ba14ca4df79b128c9f4ecc1c1

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]