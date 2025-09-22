FROM nginxinc/nginx-unprivileged:1.29.1@sha256:b58f87ce18de66dbc5bd2b557e20d509e445c12be59c0444d5c6acf5bcacc0f2

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]