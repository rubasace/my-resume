FROM nginxinc/nginx-unprivileged:1.27.4@sha256:76fb15abad2b5d5f71c5c0de087c364050eb318255797bf855990e36cea24a1c

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]