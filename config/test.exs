import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ex17ls, Ex17ls.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ex17ls_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ex17ls, Ex17lsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "toOe4wTfVhk67ieD2W26YYN4iqXOsGhTuMJEFMmtcGEJOawZESygEUfAc468bun0",
  server: false

# In test we don't send emails.
config :ex17ls, Ex17ls.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
