FROM nginxinc/nginx-unprivileged:1.27.4@sha256:7f5f11aecd21f0f95267396b8e0fb839312368fdaa51b15199d28f03d91ccdc3

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]