FROM nginxinc/nginx-unprivileged:1.30.0@sha256:9b269aa3263e1dcba790fda66aa91b6b02f904adcd8329e5cf256e14a65e2974

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]