defmodule V1Web.Resolvers.User do
  alias V1Web.User

  def all(params, _), do: User.all(params)

  def find(%{id: id}, _) do
    id = String.to_integer(id)

    User.find(%{id: id})
  end

  # TODO: add code for mutations
end
