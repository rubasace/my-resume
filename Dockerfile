FROM nginxinc/nginx-unprivileged:1.29.2@sha256:abdc43cf1bf52b0a435e5c1f57f030afb0cc09134c169ddce0d1eab0e9e7ac7a

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]