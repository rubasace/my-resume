FROM nginxinc/nginx-unprivileged:1.27.2@sha256:b78d292c0124234af72b1162686fa974b619d8e1087755b3c696fd64af3999a6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]