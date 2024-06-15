defmodule V1Web.Schema.Mutations.User do
  use Absinthe.Schema.Notation

  alias V1Web.Resolvers

  object :user_mutations do
    field :create_user, :user do
      arg(:id, non_null(:id))
      arg(:name, :string)
      arg(:email, :string)
      arg(:preferences, :communication_preferences)

      resolve(&Resolvers.User.create/2)
    end

    field :update_user, :user do
      arg(:id, non_null(:id))
      arg(:name, :string)
      arg(:email, :string)

      resolve(&Resolvers.User.update_user_identity/2)
    end

    field :update_user_preferences, :user do
      arg(:id, non_null(:id))
      arg(:preferences, :communication_preferences)

      resolve(&Resolvers.User.update_user_prefs/2)
    end
  end
end
