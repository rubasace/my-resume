FROM nginxinc/nginx-unprivileged:1.27.0@sha256:1645798310a56491acb75d750ed6a4693a35506c9860503d21a877cc54d95191

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]