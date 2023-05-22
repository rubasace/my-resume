FROM nginxinc/nginx-unprivileged:1.24.0@sha256:86bdcc5a0b2c8efba5147356de9e1562d1091eabe7603502ef6166716d0d315e

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]