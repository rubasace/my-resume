FROM nginxinc/nginx-unprivileged:1.29.2@sha256:de36547c7676950e1922a538aa1fe0afeceafe9b2cbcca732d5e17d0cac891b5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]