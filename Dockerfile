FROM nginxinc/nginx-unprivileged:1.29.2@sha256:991161869875a38dc8b6b3226e6d41c4e6481edc5521ca716362e35880b21a25

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]