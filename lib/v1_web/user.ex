defmodule V1Web.User do
  @users [
    %{
      id: 1,
      name: "Bill",
      email: "bill@gmail.com",
      preferences: %{
        likes_emails: false,
        likes_phone_calls: true,
        likes_faxes: true
      }
    },
    %{
      id: 2,
      name: "Alice",
      email: "alice@gmail.com",
      preferences: %{
        likes_emails: true,
        likes_phone_calls: true,
        likes_faxes: true
      }
    },
    %{
      id: 3,
      name: "Jill",
      email: "jill@gmail.com",
      preferences: %{
        likes_emails: true,
        likes_phone_calls: true,
        likes_faxes: false
      }
    },
    %{
      id: 4,
      name: "Tim",
      email: "tim@gmail.com",
      preferences: %{
        likes_emails: false,
        likes_phone_calls: false,
        likes_faxes: false
      }
    }
  ]

  def all(preferences) do
    case Enum.filter(@users, fn user ->
           match?(^preferences, Map.take(user.preferences, Map.keys(preferences)))
         end) do
      [] -> {:error, %{message: "not found", details: preferences}}
      users -> {:ok, users}
    end
  end

  def find(%{id: id}) do
    case Enum.find(@users, &(&1.id == id)) do
      nil -> {:error, %{message: "not found", details: %{id: id}}}
      user -> {:ok, user}
    end
  end

  def create(id, params) do
    case Enum.find(@users, &(&1.id == id)) do
      nil ->
        user = params
        {:ok, user}

      _user ->
        {:error, %{message: "Could not create, user exists!", details: %{id: id}}}
    end
  end

  def update_identity(id, params) do
    with {:ok, user} <- find(%{id: id}) do
      {:ok, Map.merge(user, params)}
    end
  end

  def update_preferences(id, params) do
    with {:ok, user} <- find(%{id: id}) do
      just_preferences = Map.merge(user.preferences, params)
      user = Map.merge(user, %{preferences: just_preferences})
      {:ok, user.preferences}
    end
  end
end
