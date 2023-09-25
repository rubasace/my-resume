FROM nginxinc/nginx-unprivileged:1.25.2@sha256:fe07657f5d29ece4e375822a1184256eacbf9b9fe5ee3c709a256afe969036d6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]