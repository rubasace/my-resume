FROM nginxinc/nginx-unprivileged:1.29.1@sha256:d97a7c08c0ebcee8e7337527d28ef03da32390820eae72f376912f86d9cdcb45

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]