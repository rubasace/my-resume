FROM nginxinc/nginx-unprivileged:1.29.0@sha256:6cc82633c23919e0599558ad73b643f95b748f265e192140affb260771c4e778

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]