FROM nginxinc/nginx-unprivileged:1.29.1@sha256:6eb1d841743d6f4f48104a025f696942bd6f331b847f69f1dd925ae299f53a62

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]