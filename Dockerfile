FROM nginxinc/nginx-unprivileged:1.25.4@sha256:060d468f78f016c7cfd49a548ed5d3456891cba1b54767b4ed48907981266f06

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]