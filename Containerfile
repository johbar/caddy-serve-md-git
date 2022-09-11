FROM ubi9/ubi-minimal:latest

# RUN curl -o /usr/local/bin/caddy --silent --fail --show-error --location \
#     "https://caddyserver.com/api/download?os=linux&arch=amd64&p=github.com%2Fgreenpau%2Fcaddy-git&idempotency=83162372623718" &&\
#     chmod +x /usr/local/bin/caddy-git

COPY caddy-git /usr/local/bin/caddy-git

RUN chmod +x /usr/local/bin/caddy-git

COPY chroma2.css style.css index.html Caddyfile favicon.ico /var/www/

WORKDIR /var/www/

EXPOSE 8080

CMD ["/usr/local/bin/caddy-git", "run"]