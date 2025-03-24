FROM nginxinc/nginx-unprivileged:1.27.4@sha256:2ab8a5f2333e28ddb38819b0eb86fb71b959f5a481cec62cef574570f2d8c573

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]