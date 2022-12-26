FROM nginxinc/nginx-unprivileged:1.23.3@sha256:313fe5adbce0bccff7365683686b075a1983e2b7b62b8f0c96fea8664324e073

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]