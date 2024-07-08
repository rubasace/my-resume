FROM nginxinc/nginx-unprivileged:1.27.0@sha256:53d5cf56deec8859bab89c7ce7d10b5a9840c0f085611e8bf0a0df8e2e69932c

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]