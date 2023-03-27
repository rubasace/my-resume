FROM nginxinc/nginx-unprivileged:1.23.3@sha256:1050abb5d9a3749f2d1be5cf44d9f5975c6bd43d206d6f8269e5eca059c98960

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]