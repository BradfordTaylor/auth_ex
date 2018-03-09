# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :auth_ex, AuthExWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "", # Replace this with the output of the mix command
  render_errors: [view: AuthExWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuthEx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :auth_ex, AuthEx.Auth.Guardian,
       issuer: "auth_ex", # Name of your app/company/product
       secret_key: "" # Replace this with the output of the mix command

config :exldap, :settings,
       server: "ldap.forumsys.com",
       base: "dc=example,dc=com",
       port: 389,
       ssl: false,
       user_dn: "cn=read-only-admin,dc=example,dc=com",
       password: "password",
       search_timeout: 5_000

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
