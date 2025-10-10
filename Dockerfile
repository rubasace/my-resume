FROM nginxinc/nginx-unprivileged:1.29.1@sha256:593a17dc61d117d1bfb208246903265abe0047c5bd4508b6e790895924b24c31

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]