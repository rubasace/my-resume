FROM nginxinc/nginx-unprivileged:1.26.0@sha256:4099c02ef0e3a89fb51dad1392421aefcd1b302e751aae6ed39174d89bfadc4e

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]