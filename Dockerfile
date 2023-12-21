FROM nginxinc/nginx-unprivileged:1.25.3@sha256:afc7298a02ebbaddc20ad71dc055d276d45d4fc63a7f0e471bcf6cd358763ba9

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]