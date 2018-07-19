defmodule API do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(API.Endpoint, [])
      #worker(Mongo, [[name: :mongo, database: "togebuild", pool: DBConnection.Poolboy]])
    ]

    opts = [strategy: :one_for_one, name: API.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    API.Endpoint.config_change(changed, removed)
    :ok
  end
  
  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
