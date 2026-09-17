FROM nginxinc/nginx-unprivileged:1.31.6@sha256:e44b470e571b20d935336bfb9f8277c1468d15e1e4d105a12ab5609d0b4682cb

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]