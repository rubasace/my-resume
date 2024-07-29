FROM nginxinc/nginx-unprivileged:1.27.0@sha256:ec783757c240e99a713eba1def9a88b983a133da215f517ed2d9a6fd734c2ad1

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]