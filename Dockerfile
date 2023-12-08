FROM nginxinc/nginx-unprivileged:1.25.3@sha256:1d026ae92e50e76c77ca776f234f154d4a1d39e33e8f813115e53c2a9b893bc9

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]