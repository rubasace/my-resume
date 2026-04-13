FROM nginxinc/nginx-unprivileged:1.29.8@sha256:49b1dda3714696e4930e5cd419ede1c62f3fdc64e98ff636b201966f17e0b9a2

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]