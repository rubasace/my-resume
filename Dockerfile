FROM nginxinc/nginx-unprivileged:1.25.4@sha256:41a41f6fde530ed3abc74d54111ffeece1b003d0d9f1c1a741fc9c31b95bc0a8

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]