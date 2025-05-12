FROM nginxinc/nginx-unprivileged:1.28.0@sha256:268e2bf6771ecce36403cc783635ab2a3ca95840c4754266f853d658f98247eb

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]