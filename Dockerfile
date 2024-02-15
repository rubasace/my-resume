FROM nginxinc/nginx-unprivileged:1.25.4@sha256:776c8ad8510a8f883b772667d46bad227f49848347a047f6de0965dd48982cb8

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]