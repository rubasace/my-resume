FROM nginxinc/nginx-unprivileged:1.23.3@sha256:cc017c7baef3899d3cf0100571881c759c2721fb76bf027071d065d6440bd4cf

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]