FROM nginxinc/nginx-unprivileged:1.29.8@sha256:c18d5e1673c851cb459a10d3a2c164e485191d97254ac6815a0cb1c1a767b9b6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]