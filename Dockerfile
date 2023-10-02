FROM nginxinc/nginx-unprivileged:1.25.2@sha256:ad9a0ffaf09f6631f0f6a11f20a981e72a4b2a0c79a9b5429af1ee5709b7d69e

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]