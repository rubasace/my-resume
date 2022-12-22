FROM nginxinc/nginx-unprivileged:1.23.3@sha256:f6e55c697275037338943f7f4d212d5716de9e0284da334538c8c30704257cdb

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]