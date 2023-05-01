FROM nginxinc/nginx-unprivileged:1.24.0@sha256:93d5da1c9ecb6e109e7b0d1ac8606845b9912d7664b9d0f6610a2fca839f37bb

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]