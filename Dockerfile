FROM nginxinc/nginx-unprivileged:1.25.0@sha256:72ed617725ef49e2367975f354c5f2eed377a5f42c1feea004bddcaab2aa5d1a

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]