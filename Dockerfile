FROM nginxinc/nginx-unprivileged:1.25.2@sha256:14aea4dc576f24c0152bae4bcb98286c9fbfde8b54d96a60d3d6515127f3dfbf

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]