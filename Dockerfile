FROM nginxinc/nginx-unprivileged:1.29.2@sha256:585d7c4312550836f382a009cae77e630baaef174930a06ac248feba16c78e74

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]