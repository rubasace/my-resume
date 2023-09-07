FROM nginxinc/nginx-unprivileged:1.25.1@sha256:32a2d766cd48f6d123f9694a817245bc05efb17d9e5d3a9c8abef1113ec4b4a2

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]