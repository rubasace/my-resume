FROM nginxinc/nginx-unprivileged:1.27.2@sha256:890b8283159ff3eec13ee426a2cd79d5a7d7a300457074970ea14c75865dc39c

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]