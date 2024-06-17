FROM nginxinc/nginx-unprivileged:1.27.0@sha256:f0feab98b8862c7f79f7416c05d8eb04eefed81de4be21eb93987ecd8738a60d

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]