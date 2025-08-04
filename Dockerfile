FROM nginxinc/nginx-unprivileged:1.29.0@sha256:502f1c37b8f59632f42cc615a5bb4709bb8e1cbc0e728118496361dfbc4302af

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]