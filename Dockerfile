FROM nginxinc/nginx-unprivileged:1.23.3@sha256:8f82f4802657ab04485c195a29769d961d8b365c807ee9ba41ceb9d8abd275e3

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]