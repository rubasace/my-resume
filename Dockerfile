FROM nginxinc/nginx-unprivileged:1.25.1@sha256:98c321fa2bddfdba40f8ecb77a669da7f0f5ac7ed533d80e16f3c0d91c6880b7

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]