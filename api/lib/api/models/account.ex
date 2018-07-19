defmodule API.Models.Account do
  use Absinthe.Schema.Notation

  object :user do
    field(:id, :id)
    field(:name, :string)
  end

  def find_user(_parent, %{id: id}, _resolution), do: find_user(id)
  def find_user(id) do
    {:ok,
     %{
       name: "Fake user",
       id: id
     }}
  end
end
