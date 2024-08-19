FROM nginxinc/nginx-unprivileged:1.27.1@sha256:ad6b833a16dc1d2e2234f70ec65c2fca7987db7d997c62dc13a10678c983a412

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]