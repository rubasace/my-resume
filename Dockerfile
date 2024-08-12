FROM nginxinc/nginx-unprivileged:1.27.0@sha256:e0b90e4ae842abc9b3eecba9344b0f7c11276346e548659a500ecea18771687c

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]