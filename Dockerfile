FROM nginxinc/nginx-unprivileged:1.30.0@sha256:3def659164dfb7d6be8563983ea9d2fe7e4dfcf2af96770d728723a5c5ad3bad

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]