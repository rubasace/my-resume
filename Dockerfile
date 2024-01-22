FROM nginxinc/nginx-unprivileged:1.25.3@sha256:0c0ebe80bcaa383913d02fdc909373f89321977dd269472895c187afcd0777eb

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]