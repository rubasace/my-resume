FROM nginxinc/nginx-unprivileged:1.29.1@sha256:ff72f15feb23f77191325c122f70c791204c45b1e91a3e200bbf986b4cd8ba96

COPY dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]