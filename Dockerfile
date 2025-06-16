FROM nginxinc/nginx-unprivileged:1.28.0@sha256:8db6e8c2057a26b7b8e60f56efb3aca51a25380de05e16a581c0b74ff37a2501

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]