FROM nginxinc/nginx-unprivileged:1.27.0@sha256:3d37056ed5dc2e6011d83664189a33ad4bb2099d125abb13b89c9c3596ed8b42

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]