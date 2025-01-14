FROM nginxinc/nginx-unprivileged:1.27.3@sha256:d0ebbd60453d566b6c497adb4c0c220ba0aa1bc0d654a6975aa65e16ae11d8fb

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]