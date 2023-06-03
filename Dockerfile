FROM nginxinc/nginx-unprivileged:1.25.0@sha256:46da9aa2695e81c09ae487ecc6a50f6c63bf5d790e67e8b6b1398ffdbfedbac1

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]