FROM nginxinc/nginx-unprivileged:1.28.0@sha256:fe7beb9c152991f058e9312804d6e13acd7dc29a799632c4dcb868e1253644e5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]