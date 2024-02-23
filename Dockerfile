FROM nginxinc/nginx-unprivileged:1.25.4@sha256:2bcc62edc5fd36a3ec139493a8f3dce05abe4f77f5b384ca15a71ae95b64da6d

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]