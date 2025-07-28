FROM nginxinc/nginx-unprivileged:1.29.0@sha256:e66547d110c6cc10ca7bf0157ed580b203a8c3ff6bd47b2d31d20a071253d5cf

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]