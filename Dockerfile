FROM nginxinc/nginx-unprivileged:1.28.0@sha256:02776f71690c1a764da6fdb104ebf793d8f0064d6c2854dfce5289e301683edf

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]