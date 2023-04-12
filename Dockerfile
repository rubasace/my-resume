FROM nginxinc/nginx-unprivileged:1.23.4@sha256:ccccf5fc563abc773e020b6d5e12004f313a42ac485c1162a67ad291ace7cd07

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]