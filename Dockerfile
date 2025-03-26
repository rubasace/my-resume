FROM nginxinc/nginx-unprivileged:1.27.4@sha256:b977cb0de28d262af9ea447a470fc94aff65c72de2d2ad89d18891f6b46b132b

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]