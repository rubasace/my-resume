FROM nginxinc/nginx-unprivileged:1.27.0@sha256:93e63f1e207307f8b0f173df9b69b7e9b4571dab86da30fc9305a90ae4dcacd5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]