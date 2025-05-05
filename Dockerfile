FROM nginxinc/nginx-unprivileged:1.28.0@sha256:f78874a7cd6c4dd8a5d33a287c7a09a2a4ae8717fc843500246d5b69b9dcb239

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]