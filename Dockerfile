FROM nginxinc/nginx-unprivileged:1.29.1@sha256:ad78b4a52a68a93aa3490260e0bf7b3afd35689d312f22bb28300fbe43a158e5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]