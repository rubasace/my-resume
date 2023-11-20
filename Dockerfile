FROM nginxinc/nginx-unprivileged:1.25.3@sha256:198442edfc1f70ffa15c21ba80976903ff376b9aba3c77b11148f2018f2928b9

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]