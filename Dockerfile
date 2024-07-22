FROM nginxinc/nginx-unprivileged:1.27.0@sha256:8c7710010fe4820b0b5562622fe4a24d2d7844172627fae039f4f7762bd18cb9

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]