FROM nginxinc/nginx-unprivileged:1.28.0@sha256:958c09a5f0ba8adb5b1921168df399108ea6800d623487af933d47dafffa7b22

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]