FROM nginxinc/nginx-unprivileged:1.29.3@sha256:9f65d92815e29f3cdf5a3c26050b0bb04d5abe553c91b2bcf49d1fc68843d4a9

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]