FROM nginxinc/nginx-unprivileged:1.27.1@sha256:46dafc15143e8b97ec827b3dd330639fb509569f7b2c550491962ceeb6d3ae8d

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]