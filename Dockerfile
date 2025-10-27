FROM nginxinc/nginx-unprivileged:1.29.2@sha256:2b78dc1cab1ee147d9bdfdae61d4d85035858ae1eaef5f318f59ca84925b3279

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]