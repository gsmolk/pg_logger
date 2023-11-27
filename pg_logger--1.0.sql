/* contrib/pg_errors/pg_logger--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_logger" to load this file. \quit

CREATE OR REPLACE FUNCTION pg_logger_reset()
RETURNS void
AS 'MODULE_PATHNAME'
LANGUAGE C PARALLEL SAFE;

-- Don't want this to be available to non-superusers.
REVOKE ALL ON FUNCTION pg_errors_reset() FROM PUBLIC;

CREATE OR REPLACE FUNCTION pg_logger_stats_get(
    OUT statement_cancel int8,
    OUT statement_timeout int8,
    OUT lock_timeout int8,
    OUT idle_in_tx_timeout int8
)
RETURNS record
AS 'pg_logger'
LANGUAGE C PARALLEL SAFE;

-- Register a view on the function for ease of use.
CREATE VIEW pg_logger_stats AS
  SELECT * FROM pg_logger_stats_get();

GRANT SELECT ON pg_logger_stats TO PUBLIC;
