use Mix.Config

config :engineerit, API.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
