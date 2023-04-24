FROM nginxinc/nginx-unprivileged:1.23.4@sha256:f8b0017f765154c69bca6e8b58dcb8492ca9d4e2f8df2f65061f6a69052f5308

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]