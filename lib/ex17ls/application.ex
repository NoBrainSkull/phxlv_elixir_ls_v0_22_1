defmodule Ex17ls.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Ex17lsWeb.Telemetry,
      # Start the Ecto repository
      Ex17ls.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ex17ls.PubSub},
      # Start Finch
      {Finch, name: Ex17ls.Finch},
      # Start the Endpoint (http/https)
      Ex17lsWeb.Endpoint
      # Start a worker by calling: Ex17ls.Worker.start_link(arg)
      # {Ex17ls.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ex17ls.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Ex17lsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
