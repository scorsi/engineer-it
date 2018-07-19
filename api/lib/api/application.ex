defmodule API.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(API.Endpoint, []),
      worker(Mongo, [[name: :mongo, database: "togebuild", pool: DBConnection.Poolboy]])
    ]

    opts = [strategy: :one_for_one, name: API.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    API.Endpoint.config_change(changed, removed)
    :ok
  end
end
