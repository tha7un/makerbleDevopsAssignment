#!/bin/bash
set -e

until pg_isready -h db -p 5432 -U postgres; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done

bundle exec rails db:create db:migrate

exec "$@"