FROM nginxinc/nginx-unprivileged:1.26.0@sha256:2f9cdab1fb340a6c1908366654c4d6b19d58286a46635eb034a53fc61b44c34d

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]