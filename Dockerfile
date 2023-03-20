FROM nginxinc/nginx-unprivileged:1.23.3@sha256:bc911e3b9c9d87e5ba84dc2b4fed7679c1309c850ed7a4517f69912fe76121ef

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]