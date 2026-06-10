FROM nginxinc/nginx-unprivileged:1.31.0@sha256:aec682793332fc27902884afe08221adc5a4ceca154954edd1bcb147ee3cc6b4

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]