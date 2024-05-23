defmodule V1Web.Schema do
  use Absinthe.Schema

  alias V1Web.User

  import_types(V1Web.Types.User)
  import_types(V1Web.Schema.Queries.User)

  # query do
  #   import_fields :user_queries
  # end

  query do
    field :user, :user do
      arg(:id, non_null(:id))

      resolve(fn %{id: id}, _ ->
        id = String.to_integer(id)
        User.find(%{id: id})
      end)
    end

    field :users, list_of(:user) do
      arg(:likes_emails, :boolean)
      arg(:likes_phone_calls, :boolean)
      arg(:likes_faxes, :boolean)

      resolve(fn params, _ ->
        User.all(params)
      end)
    end
  end
end
