FROM nginxinc/nginx-unprivileged:1.29.5@sha256:bd68c793125e39123d1fdf3c0e9b7d4218667b9db049ed46b1b71aa4cb4493ef

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]