FROM nginxinc/nginx-unprivileged:1.29.0@sha256:5957d8d004517de8a53af6812bdb1b779d7c6746a611569af59b22660925f47b

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]