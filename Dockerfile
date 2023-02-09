FROM nginxinc/nginx-unprivileged:1.23.3@sha256:12201ead07a4c8f5e40832669e90b0b76cd4601914d448b1353594edc050efa2

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]