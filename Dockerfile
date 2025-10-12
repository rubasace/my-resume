FROM nginxinc/nginx-unprivileged:1.29.2@sha256:1ed9133d03818da88225fc6930fa3a938328def27cb8cec7821ee72152b5feca

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]