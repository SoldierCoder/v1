defmodule V1Web.Schema do
  use Absinthe.Schema

  import_types(V1Web.Types.User)
  import_types(V1Web.Schema.Queries.User)
  import_types(V1Web.Schema.Mutations.User)

  query do
    import_fields(:user_queries)
  end

  mutation do
    import_fields(:user_mutations)
  end
end
