FROM nginxinc/nginx-unprivileged:1.27.0@sha256:22d95994c040751adfd1ac98212b3552689cdc972b75ce4969701e21e3d6f050

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]