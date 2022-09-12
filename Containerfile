FROM registry.access.redhat.com/ubi9/ubi-minimal:latest 

RUN curl -o /usr/local/bin/caddy-git --silent --fail --show-error --location \
    "https://caddyserver.com/api/download?os=linux&arch=amd64&p=github.com%2Fgreenpau%2Fcaddy-git&idempotency=83162372623718" &&\
    chmod +x /usr/local/bin/caddy-git

# Use local binary instead of curl above:
# COPY caddy-git /usr/local/bin/caddy-git
# RUN chmod +x /usr/local/bin/caddy-git

RUN adduser --uid 2019 caddy

WORKDIR /home/caddy/.local/share/caddy

COPY --chown=2019 chroma2.css style.css index.html favicon.ico .

COPY Caddyfile /home/caddy/.config/caddy/

RUN chown --recursive caddy:caddy /home/caddy

USER 2019

EXPOSE 8080

CMD ["/usr/local/bin/caddy-git", "run", "-config", "/home/caddy/.config/caddy/Caddyfile"]