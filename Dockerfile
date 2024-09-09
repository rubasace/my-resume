FROM nginxinc/nginx-unprivileged:1.27.1@sha256:0569e319d06556564ad40882ed35231461d06bec788b5aec00b83b6e9f3ced1a

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]