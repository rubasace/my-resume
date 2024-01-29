FROM nginxinc/nginx-unprivileged:1.25.3@sha256:5cd84cd1f0207a745f05c306cdea1425dda0e25795a5279b65ade4fb593be67f

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]