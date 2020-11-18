# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :qrcar_micro_enterprise_identification,
  ecto_repos: [QrcarMicroEnterpriseIdentification.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :qrcar_micro_enterprise_identification, QrcarMicroEnterpriseIdentificationWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fZg/T+tZozF9dD3PuO6s7dULy/3p1lhNZ2LOo8kkfzMhwU7lBQhc0EpjcGIlyUpw",
  render_errors: [view: QrcarMicroEnterpriseIdentificationWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: QrcarMicroEnterpriseIdentification.PubSub,
  live_view: [signing_salt: "V5o60FAi"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Use Swagger to auto-Doc
config :qrcar_micro_enterprise_identification, :phoenix_swagger,
       swagger_files: %{
         "priv/static/swagger.json" => [
           router: QrcarMicroEnterpriseIdentificationWeb.Router,     # phoenix routes will be converted to swagger paths
           endpoint: QrcarMicroEnterpriseIdentificationWeb.Endpoint  # (optional) endpoint config used to set host, port and https schemes.
         ]
       }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
