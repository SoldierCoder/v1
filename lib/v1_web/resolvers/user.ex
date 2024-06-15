defmodule V1Web.Resolvers.User do
  alias V1Web.User

  def all(params, _), do: User.all(params)

  def find(%{id: id}, _) do
    id = String.to_integer(id)

    User.find(%{id: id})
  end

  # TODO: add code for mutations
  def create(%{id: id} = params, _) do
    id = String.to_integer(id)
    User.create(id, params)
  end

  def update_user_identity(%{id: id} = params, _) do
    id = String.to_integer(id)
    User.update_identity(id, params)
  end

  def update_user_prefs(%{id: id} = params, _) do
    id = String.to_integer(id)
    User.update_preferences(id, params)
  end
end
