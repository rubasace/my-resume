FROM nginxinc/nginx-unprivileged:1.27.1@sha256:c04681a5cb8e33ea61d08a25cc3c186273b310ff1fff454ca0d9fa9b553fd7cf

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]