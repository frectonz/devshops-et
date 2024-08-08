# DevshopsEt

A Catalog of Ethiopian Software Companies.

![screenshot](./screenshot.png)

## Run with Docker

```sh
docker pull frectonz/devshops_et
docker run -p 4000:4000 \
            -e DATABASE_URL="ecto://user:password@host/database" \
            -e SECRET_KEY_BASE="generate this with `mix phx.gen.secret`" \
            -e AUTH_USERNAME="me" \
            -e AUTH_PASSWORD="password" \
            -e BOT_TOKEN="the admin telegram bot token" \
            -e ADMIN_GROUP_CHAT_ID="telegram group id to send messages to" \
            frectonz/devshops_et
```

## Contributing

```sh
mix setup
mix phx.server
```
