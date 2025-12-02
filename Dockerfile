FROM nginxinc/nginx-unprivileged:1.29.2@sha256:6472391225b0fdd50b51c09a249163cbee5a66af3a78806497d483685628afa1

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]