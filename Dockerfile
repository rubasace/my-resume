FROM nginxinc/nginx-unprivileged:1.25.3@sha256:a4cb3ee8f71116750ae3dc857031b7c74ec3b21df3d878e1c63204c206553e46

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]