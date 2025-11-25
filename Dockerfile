FROM nginxinc/nginx-unprivileged:1.29.2@sha256:752e563fc4abc108afe1bc25d72f2169969abb5eb89e65bf76abeb2802617e4a

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]