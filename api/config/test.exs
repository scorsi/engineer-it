use Mix.Config

config :togebuild, API.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
