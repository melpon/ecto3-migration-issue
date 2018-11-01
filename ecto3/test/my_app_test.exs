defmodule MyAppTest do
  use ExUnit.Case

  defmodule Test do
    use Ecto.Schema

    schema "myapptest_test" do
      timestamps()
    end
  end

  defmodule TestMigration do
    use Ecto.Migration

    def change() do
      create table(:myapptest_test) do
        add(:inserted_at, :utc_datetime, null: false)
        add(:updated_at, :utc_datetime, null: false)
      end
    end
  end

  test "test" do
    Ecto.Adapters.SQL.Sandbox.unboxed_run(MyApp.Repo, fn ->
      Ecto.Adapters.SQL.Sandbox.mode(MyApp.Repo, {:shared, self()})
      Ecto.Migrator.up(MyApp.Repo, 100, TestMigration)
    end)
  end
end
