FROM nginxinc/nginx-unprivileged:1.28.0@sha256:60fb76d5a8c95f5af3b5c6b0b53474c9d2bdb61d6e684d7bd9397acd69b2111c

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]