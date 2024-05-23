defmodule V1Web.Router do
  use V1Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: V1Web.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: V1Web.Schema,
      interface: :playground
  end
end
