# caddy-serve-md-git

Serves a markdown git repo as HTML using [Git-Caddy](https://github.com/greenpau/caddy-git).

Still work in progress.

## Build

Build and run with `podman`

```sh
podman build . -t caddy-serve-md-git
podman run -it --rm -p 8080:8080 -e GIT_REPO_URL=https://github.com/johbar/caddy-serve-md-git.git localhost/caddy-serve-md-git:latest
```

Change env `GIT_REPO_URL` accordingly.

More env to customize behavior:

| Name | Description
| ---   | ---
| GIT_BRANCH  | Git-Ref to clone  (default: `main`)
| UPDATE_SECONDS | Interval of automatic update (default: `600`)

## See also

* [caddy-markdown-site](https://github.com/dbohdan/caddy-markdown-site)
* [More CSS options](https://github.com/dbohdan/classless-css)
* Also inspired by [how Caddy serves their website](https://github.com/caddyserver/website)
