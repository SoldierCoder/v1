defmodule V1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      V1Web.Telemetry,
      {DNSCluster, query: Application.get_env(:v1, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: V1.PubSub},
      # Start a worker by calling: V1.Worker.start_link(arg)
      # {V1.Worker, arg},
      # Start to serve requests, typically the last entry
      V1Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: V1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    V1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
