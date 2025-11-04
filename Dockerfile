FROM nginxinc/nginx-unprivileged:1.29.2@sha256:932d0f97253d13ac3dfaeecbd6bebb0b5ab920f3e2bb0549aa38d79e6535bd90

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]