# RAILS API LAB

## Setup

```
docker compose build
docker compose up -d
docker compose exec app rails db:setup
```

## Call Grape API

- authors
  - http://localhost:3000/v1/authors
- posts
  - http://localhost:3000/v1/posts
