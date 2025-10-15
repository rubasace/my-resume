FROM nginxinc/nginx-unprivileged:1.29.2@sha256:5faa8648305e93ff7b562a7a576d9f8ef8f5ed78d9c28765bb6551fe461f2606

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]