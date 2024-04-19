FROM nginxinc/nginx-unprivileged:1.25.5@sha256:da87da7eb4e6055c7f016dd1e7dcd73df894391517ac13a6952247b612cae58c

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]