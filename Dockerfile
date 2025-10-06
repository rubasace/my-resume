FROM nginxinc/nginx-unprivileged:1.29.1@sha256:66152e45fb79d8027a145b5995ef1dc8d7ace34a8e1f6f323e73cc22ed8adf24

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]