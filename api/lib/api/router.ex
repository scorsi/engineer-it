defmodule API.Router do
  use API, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/",
      Absinthe.Plug,
      schema: API.Schema
  end

  forward "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: API.Schema,
    interface: :simple
end
