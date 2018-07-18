use Mix.Config

config :engineerit,
  namespace: API

config :engineerit, API.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RLL3W/7q/tq5U9s7JWaxbOQpg2TWcC9fiMRfC1a0ej+tvcXYOTVqYB3cUbt36uKb",
  render_errors: [view: API.ErrorView, accepts: ~w(json)],
  pubsub: [name: API.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

import_config "#{Mix.env}.exs"
