FROM nginxinc/nginx-unprivileged:1.23.2@sha256:035c80cd6f0399321eb5f651cb9f3dcc501dab3da28d2a98116b702686d24ddc

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]