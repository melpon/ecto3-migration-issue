use Mix.Config

config :my_app, MyApp.Repo,
  username: "postgres",
  password: "",
  database: "myapp_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :my_app,
  ecto_repos: [MyApp.Repo]

