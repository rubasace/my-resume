FROM nginxinc/nginx-unprivileged:1.29.0@sha256:3161d975277f6af7e171bdccf48e3469cab8e5788fa63767f6656d4bfb49549c

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]