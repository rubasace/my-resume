FROM nginxinc/nginx-unprivileged:1.29.2@sha256:f49a24d1e97e3dae60cc694bb15895b75aca479c4d2bec09863f9bafd9665748

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]