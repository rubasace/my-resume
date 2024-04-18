FROM nginxinc/nginx-unprivileged:1.25.4@sha256:7e36111660f0dc116a6af1ab053b0b8091f8399ed2e07bd7083635573ffd69b6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]