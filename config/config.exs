# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :user_random_points,
  ecto_repos: [UserRandomPoints.Repo]

# Configures the endpoint
config :user_random_points, UserRandomPointsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "l2lzxGl6Y3hlkQ3saLlbnXR7Uc3CbxPs5ZeiQ4jWF3+EP6y1UszVK4Oh3k9iyBNR",
  render_errors: [view: UserRandomPointsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: UserRandomPoints.PubSub,
  live_view: [signing_salt: "OomJFqDu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
