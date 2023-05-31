FROM nginxinc/nginx-unprivileged:1.24.0@sha256:cd7c3a8aeb539b0d97a3d97e2ae1ce9c94d71d13595413095beb0d0bd58896ee

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]