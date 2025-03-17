FROM nginxinc/nginx-unprivileged:1.27.4@sha256:228360b3d6b18001d7c123486d7c267e3278b32d14864ee14f92f35156c34bed

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]