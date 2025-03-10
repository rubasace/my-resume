FROM nginxinc/nginx-unprivileged:1.27.4@sha256:2370a1e00c509f9fda63343d7c87ddaa18b3a02e44cf1ffd44f880abd851c240

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]