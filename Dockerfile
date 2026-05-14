FROM nginxinc/nginx-unprivileged:1.30.1@sha256:6f5c8f8836fce1eba7daa6b4f0dbfe7aa742be47e1b15386a67be7a3dbd06086

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]