FROM nginxinc/nginx-unprivileged:1.27.4@sha256:59ff0cca538c6a964174ad6745df379757f9d72bba586be4c3b1faae02a3c458

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]