FROM nginxinc/nginx-unprivileged:1.29.1@sha256:14d354dd14cb47ac0a661e2347f4c946fe14a5af5e1db8ebc908c24536ffc06d

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]