FROM nginxinc/nginx-unprivileged:1.27.2@sha256:d2ce7dcc2bd61e54ea75e3f07dea8c15e8eb9a0416aecfb12d736fbed5669619

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]