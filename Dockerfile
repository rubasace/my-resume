FROM nginxinc/nginx-unprivileged:1.27.1@sha256:144210beee75048a0db053eada2e4555fe70724a122a4049aac9acb8bb1de9bf

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]