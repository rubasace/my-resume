FROM nginxinc/nginx-unprivileged:1.31.3@sha256:49c9bef1797e11117a7f490fd00f282e377ac402fec472c72636f90cdbf72e10

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]