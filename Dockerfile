FROM nginxinc/nginx-unprivileged:1.25.3@sha256:190f52489a6890b3a0be261cbc459d5529a9f1d3596bf4dfb09eb8f032d0d635

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]