FROM nginxinc/nginx-unprivileged:1.28.0@sha256:aa538e1dc81068827c28ad5855bbd721f0f17a3d303f4b5d6737ddc219d1c8c6

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]