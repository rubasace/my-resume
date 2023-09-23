FROM nginxinc/nginx-unprivileged:1.25.2@sha256:436017b715fa21ed46e7313ec2dcd0b2d4d9b91860ebfd414061e1460856d186

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]