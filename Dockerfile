FROM nginxinc/nginx-unprivileged:1.29.0@sha256:1e373828998d782df06297c965abcff1e56a48fc66e52fcfd2ab10de52e1466b

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]