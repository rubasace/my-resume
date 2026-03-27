FROM nginxinc/nginx-unprivileged:1.29.5@sha256:a4b4d6c0ea8ecf5af39ca16ffd0b388aa3afd66108883560f78adb13e84d193e

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]