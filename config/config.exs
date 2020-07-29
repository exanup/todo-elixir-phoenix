# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :my_todo,
  ssl: true,
  ecto_repos: [MyTodo.Repo]

# Configures the endpoint
config :my_todo, MyTodoWeb.Endpoint,
  force_ssl: [rewrite_on: [:x_forwarded_proto], host: nil],
  url: [host: "localhost"],
  secret_key_base: "ZgiPkdkU2AZugeuRzdk/+RVwW4qLc7s2xm8Q5SL5iNe6Zj5OHvDRtssWP/afcS8E",
  render_errors: [view: MyTodoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MyTodo.PubSub,
  live_view: [signing_salt: "ZlEja3ua"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
