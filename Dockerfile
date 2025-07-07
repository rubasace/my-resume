FROM nginxinc/nginx-unprivileged:1.29.0@sha256:a7ad9ceb637fcc892a3a8a1724ab119d5d9bd41ec451ce10c02e04c47bc6ed60

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]