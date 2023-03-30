FROM nginxinc/nginx-unprivileged:1.23.3@sha256:3e76af7172a43785e0434018025c99c67c587239055392af3ce5d585f43ca8b5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]