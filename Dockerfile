FROM nginxinc/nginx-unprivileged:1.27.4@sha256:8df8fee6cabcd54c545a8a28a41d04a80cdcedb28c30c068e512f5a56aee4de4

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]