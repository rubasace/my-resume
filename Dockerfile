FROM nginxinc/nginx-unprivileged:1.29.2@sha256:39466f69197cbf5844a3aaa799b32318112aff7e07ce93557ceeee5825e0727d

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]