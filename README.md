# pg_logger

## Overview

pg_logger is an extension to send log statement via libcurl to external logging engine.

This extension is compatible with PostgreSQL 10 and higher.

## Installation

1) Get latest `pg_errors` sources:

```shell
git clone https://github.com/pgtoolz/pg_errors
```

2) Get latest PostgreSQL sources:

```shell
git clone https://github.com/postgres/postgres.git -b REL_16_STABLE && cd postgres
```

4) Compile and install PostgreSQL

5) Compile and install `pg_errors` extension

```shell
USE_PGXS=1 make -C /path/to/pg_errors/ install
```

6) Configure extension

```shell
echo "shared_preload_libraries = 'pg_errors'" >> postgres_data/postgresql.conf
```

7) Run PostgreSQL and create `pg_errors` extension

```sql
postgres=# CREATE EXTENSION pg_errors;
```

## Public SQL API

 * pg_errors — returns current statistics
 * pg_errors_reset() — reset statistics

## Upgrading

Usually, you have to only install new version of `pg_errors`, do `ALTER EXTENSION 'pg_errors' UPDATE;` and restart PostgreSQL.

## Tests

TODO

## TODO

* do not rely on PostgreSQL shmem
* flag to disable extension
