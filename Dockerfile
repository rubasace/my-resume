FROM nginxinc/nginx-unprivileged:1.23.2@sha256:b7bb49b9b5d5b9e826dad3ef98487d1c26df967597d2aa59b03a10526350efd3

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]