FROM nginxinc/nginx-unprivileged:1.29.3@sha256:74adf8fc6c9e7290a810505e0d0384fa370b6ec1ce02547eecff77e2921ee24f

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]