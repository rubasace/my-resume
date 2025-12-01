FROM nginxinc/nginx-unprivileged:1.29.2@sha256:4bfe84e4298344e5a58e3f905bdd9d640cbcaeb7362414355e1bdd320e5a9615

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]