FROM nginxinc/nginx-unprivileged:1.29.1@sha256:9e3b977d06098adc284fcfbbdfb567b8dc26c08d3f14ad29725bd8039c0c2fbf

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]