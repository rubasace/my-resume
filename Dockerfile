FROM nginxinc/nginx-unprivileged:1.27.5@sha256:1c1d30bc587c2351abb5457f3bbb2567074738cffafccf0603c7934cca574b1f

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]