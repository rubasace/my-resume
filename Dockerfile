FROM nginxinc/nginx-unprivileged:1.29.2@sha256:daa7fd58f006f61e9c6fafa74670725a455f6dde77504d1bfc1c457ef5786b83

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]