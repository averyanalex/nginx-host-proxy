FROM nginx:stable

ENV NGINX_ENTRYPOINT_WORKER_PROCESSES_AUTOTUNE=1

COPY nginx.conf /etc/nginx/nginx.conf

COPY generate.sh /docker-entrypoint.d/5-generate.sh
RUN chmod +x /docker-entrypoint.d/5-generate.sh
