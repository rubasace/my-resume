FROM nginxinc/nginx-unprivileged:1.25.3@sha256:58a18dbc3326ff39ab07edf7baa916ff25d4edd8f07a914a8ba973568027d41a

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]