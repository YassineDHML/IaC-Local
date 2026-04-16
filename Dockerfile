FROM alpine:latest

RUN apk add --no-cache nginx

RUN mkdir -p /var/www/localhost/htdocs && \
    echo "<h1>Application Deployed via Terraform IaC!</h1>" > /var/www/localhost/htdocs/index.html

RUN mkdir -p /run/nginx

COPY nginx.default.conf /etc/nginx/http.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
