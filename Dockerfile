FROM nginxinc/nginx-unprivileged:1.29.3@sha256:d62638f75536e8b6be939bdfc6bb17d99b167f0c2af4955440bc7314dc72f5a0

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]