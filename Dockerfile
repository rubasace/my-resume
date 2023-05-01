FROM nginxinc/nginx-unprivileged:1.23.4@sha256:e95629a5241778c3d5f16f8308858a1a18d1b569bf8dff304a769f9fd59530c6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]