FROM nginxinc/nginx-unprivileged:1.25.4@sha256:fc4bf78c004581ee6014d9fee0d6825854474c82918465ecb731cc4006a2dad5

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]