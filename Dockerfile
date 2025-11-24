FROM nginxinc/nginx-unprivileged:1.29.2@sha256:f0de5f2baaa61096b547dd7ab9e641429c07564e68086a932770caa4139c0e53

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]