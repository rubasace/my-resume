FROM nginxinc/nginx-unprivileged:1.25.3@sha256:3ae7d1f0aac6fb9189a2912921e704e56c3a5c20bf526cfeb3c801cdaba66330

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]