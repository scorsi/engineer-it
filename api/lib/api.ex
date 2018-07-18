defmodule API do
  def controller do
    quote do
      use Phoenix.Controller, namespace: API
      import Plug.Conn
      import API.Router.Helpers
      import API.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/api/templates",
                        namespace: API

      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      #import API.Router.Helpers
      import API.ErrorHelpers
      import API.Gettext
    end
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
      import API.Gettext
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
