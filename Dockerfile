FROM nginxinc/nginx-unprivileged:1.27.4@sha256:218e25d58d22541b93613a61a04bf6e7d0e337b3384b6f890e83b9a1027480d1

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]