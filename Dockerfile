FROM nginxinc/nginx-unprivileged:1.31.3@sha256:1ab63ed666197d757cd3ce0ad84c5136f18f774465345785f33423bd1bba4353

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]