FROM nginxinc/nginx-unprivileged:1.25.4@sha256:898edc719ceb92b89dbd9ced9f2c57986731d6aa90346137a05817ea255a506f

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]