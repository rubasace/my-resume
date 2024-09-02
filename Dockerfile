FROM nginxinc/nginx-unprivileged:1.27.1@sha256:c02e7b90670bc37fa7f61b64a266e3a7dc7eb1fda3df753db2a50a6b0657c27d

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]