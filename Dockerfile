FROM nginxinc/nginx-unprivileged:1.25.4@sha256:da119d2fa3ab66ee78a7ca4f1193fad24338aaef9ddd3bed9bd50cfd3ff99165

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]