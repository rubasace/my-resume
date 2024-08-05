FROM nginxinc/nginx-unprivileged:1.27.0@sha256:78e0a42a309fd21299b3618fdcd20d1adddb43531a3a4483df858b867a58e546

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]