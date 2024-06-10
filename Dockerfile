FROM nginxinc/nginx-unprivileged:1.27.0@sha256:73086c2912b6e298b3b558d3d4adc834a18db1f958ffbf55f58a9589a50e3e58

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]