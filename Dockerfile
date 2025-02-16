FROM nginxinc/nginx-unprivileged:1.27.3@sha256:6d51e4a8e10dfe334f8e2d15bb81b1ed2580ea9cb874b644acc720eda7022b54

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]