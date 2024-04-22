FROM nginxinc/nginx-unprivileged:1.25.5@sha256:7296e8ef16c0d708de99dbb2d29ecb408329a19f87856a7375efd1a87da39f8a

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]