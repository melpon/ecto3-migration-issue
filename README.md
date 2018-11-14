Reported and Resolved: https://github.com/elixir-ecto/ecto/issues/2784

Ecto2 command:

```
cd ecto2; mix deps.get; mix ecto.drop; mix ecto.create; mix test
```

Result:

```
The database for MyApp.Repo has been dropped
The database for MyApp.Repo has been created

21:14:47.039 [info]  == Running MyAppTest.TestMigration.change/0 forward

21:14:47.039 [info]  create table myapptest_test

21:14:47.046 [info]  == Migrated in 0.0s
.

Finished in 0.2 seconds
1 test, 0 failures

Randomized with seed 805079
```

Ecto3 command:

```
cd ecto3; mix deps.get; mix ecto.drop; mix ecto.create; mix test
```

Result:

```
The database for MyApp.Repo has been dropped
The database for MyApp.Repo has been created

21:14:22.282 [debug] QUERY OK source="schema_migrations" db=0.3ms
SELECT s0."version"::bigint FROM "schema_migrations" AS s0 FOR UPDATE []


  1) test test (MyAppTest)
     test/my_app_test.exs:23
     ** (DBConnection.ConnectionError) connection not available and request was dropped from queue after 978ms
     stacktrace:
       (db_connection) lib/db_connection.ex:766: DBConnection.transaction/3
       (ecto_sql) lib/ecto/migrator.ex:184: Ecto.Migrator.do_run_maybe_in_transaction/3
       (elixir) lib/task/supervised.ex:89: Task.Supervised.do_apply/2
       (elixir) lib/task/supervised.ex:38: Task.Supervised.reply/5
       (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
```
