FROM nginxinc/nginx-unprivileged:1.28.0@sha256:11202b98d149b80abecb6091bf961aa0a8b3f087cfc169e8ff477ece4b54d9b4

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]