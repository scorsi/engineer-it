defmodule API.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom

  alias API.Models

  import_types Models.Account

  query do
    @desc "Get a user"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &Models.Account.find_user/3
    end
  end
end
