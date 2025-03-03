FROM nginxinc/nginx-unprivileged:1.27.4@sha256:7a76302625f26fd9ea82da99c0e14c5f4def3a839b21e4138acdcbefc790219f

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]