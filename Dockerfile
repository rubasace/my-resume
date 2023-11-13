FROM nginxinc/nginx-unprivileged:1.25.2@sha256:6ead800582d2020ab766baf44a9913d6117f9206bdb616175dfe3f1425c24e38

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]