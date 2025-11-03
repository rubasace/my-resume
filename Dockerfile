FROM nginxinc/nginx-unprivileged:1.29.2@sha256:552407349aa673f06dc15c2c489fd585a1ff953b37533ed843ba0601e4d02d77

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]