FROM nginxinc/nginx-unprivileged:1.23.4@sha256:35f735cf844f4d50a306d8bb2ad8cff5ecbe7add0d55edb4d90855afaf831c11

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]